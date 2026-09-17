package com.library.lms.service;

import com.library.lms.dto.request.BookRequestDTO;
import com.library.lms.dto.response.BookResponseDTO;
import com.library.lms.dto.response.PageResponseDTO;
import com.library.lms.entity.Book;
import com.library.lms.exception.BusinessException;
import com.library.lms.exception.ResourceNotFoundException;
import com.library.lms.mapper.BookMapper;
import com.library.lms.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class BookService {

    private final BookRepository bookRepository;
    private final BookMapper bookMapper;
    @Transactional(readOnly = true)
    public List<BookResponseDTO> getAllBooks() {
        return bookRepository.findAll().stream()
                .map(bookMapper::toResponseDTO)
                .collect(Collectors.toList());
    }
    @Transactional(readOnly = true)
    public PageResponseDTO<BookResponseDTO> getPagedBooks(int page, int size, String sortBy, String direction) {
        Sort sort = direction.equalsIgnoreCase("desc") ? Sort.by(sortBy).descending() : Sort.by(sortBy).ascending();
        Pageable pageable = PageRequest.of(page, size, sort);
        Page<Book> bookPage = bookRepository.findAll(pageable);

        List<BookResponseDTO> content = bookPage.getContent().stream()
                .map(bookMapper::toResponseDTO)
                .collect(Collectors.toList());

        return PageResponseDTO.<BookResponseDTO>builder()
                .content(content)
                .pageNumber(bookPage.getNumber())
                .pageSize(bookPage.getSize())
                .totalElements(bookPage.getTotalElements())
                .totalPages(bookPage.getTotalPages())
                .isLast(bookPage.isLast())
                .build();
    }
    @Transactional(readOnly = true)
    public BookResponseDTO getBookById(Long id) {
        Book book = bookRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with id: " + id));
        return bookMapper.toResponseDTO(book);
    }
    @Transactional(readOnly = true)
    public List<BookResponseDTO> searchBooks(String query) {
        if (query == null || query.trim().isEmpty()) {
            return getAllBooks();
        }
        return bookRepository.searchBooks(query.trim()).stream()
                .map(bookMapper::toResponseDTO)
                .collect(Collectors.toList());
    }
    @Transactional
    public BookResponseDTO createBook(BookRequestDTO request) {
        if (bookRepository.existsByIsbn(request.getIsbn())) {
            throw new BusinessException("A book with ISBN " + request.getIsbn() + " already exists");
        }
        Book book = bookMapper.toEntity(request);
        Book savedBook = bookRepository.save(book);
        return bookMapper.toResponseDTO(savedBook);
    }
    @Transactional
    public BookResponseDTO updateBook(Long id, BookRequestDTO request) {
        Book book = bookRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with id: " + id));

        // If ISBN changed, check uniqueness
        if (!book.getIsbn().equals(request.getIsbn()) && bookRepository.existsByIsbn(request.getIsbn())) {
            throw new BusinessException("A book with ISBN " + request.getIsbn() + " already exists");
        }

        bookMapper.updateEntityFromDTO(request, book);
        Book updatedBook = bookRepository.save(book);
        return bookMapper.toResponseDTO(updatedBook);
    }
    @Transactional
    public void deleteBook(Long id) {
        Book book = bookRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with id: " + id));
        
        if (!book.getAvailableCopies().equals(book.getTotalCopies())) {
            throw new BusinessException("Cannot delete book: some copies are currently issued to members");
        }
        bookRepository.delete(book);
    }
}
