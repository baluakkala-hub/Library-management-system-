package com.library.lms.service;

import com.library.lms.dto.request.BookRequestDTO;
import com.library.lms.dto.response.BookResponseDTO;
import com.library.lms.entity.Book;
import com.library.lms.exception.BusinessException;
import com.library.lms.exception.ResourceNotFoundException;
import com.library.lms.mapper.BookMapper;
import com.library.lms.repository.BookRepository;
import com.library.lms.service.BookService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class BookServiceTest {

    @Mock
    private BookRepository bookRepository;

    @Mock
    private BookMapper bookMapper;

    @InjectMocks
    private BookService bookService;

    private Book sampleBook;
    private BookResponseDTO sampleResponseDTO;

    @BeforeEach
    void setUp() {
        sampleBook = Book.builder()
                .id(1L)
                .isbn("978-0132350884")
                .title("Clean Code")
                .author("Robert C. Martin")
                .category("Programming")
                .totalCopies(5)
                .availableCopies(4)
                .build();

        sampleResponseDTO = BookResponseDTO.builder()
                .id(1L)
                .isbn("978-0132350884")
                .title("Clean Code")
                .author("Robert C. Martin")
                .category("Programming")
                .totalCopies(5)
                .availableCopies(4)
                .build();
    }

    @Test
    @DisplayName("Should return all books successfully")
    void shouldGetAllBooks() {
        when(bookRepository.findAll()).thenReturn(List.of(sampleBook));
        when(bookMapper.toResponseDTO(sampleBook)).thenReturn(sampleResponseDTO);

        List<BookResponseDTO> result = bookService.getAllBooks();

        assertNotNull(result);
        assertEquals(1, result.size());
        assertEquals("Clean Code", result.get(0).getTitle());
        verify(bookRepository, times(1)).findAll();
    }

    @Test
    @DisplayName("Should throw ResourceNotFoundException when book ID not found")
    void shouldThrowExceptionWhenBookNotFound() {
        when(bookRepository.findById(99L)).thenReturn(Optional.empty());

        assertThrows(ResourceNotFoundException.class, () -> bookService.getBookById(99L));
        verify(bookRepository, times(1)).findById(99L);
    }

    @Test
    @DisplayName("Should throw BusinessException when creating book with existing ISBN")
    void shouldThrowExceptionWhenIsbnAlreadyExists() {
        BookRequestDTO request = BookRequestDTO.builder()
                .isbn("978-0132350884")
                .title("Duplicate ISBN Title")
                .author("Author")
                .totalCopies(3)
                .build();

        when(bookRepository.existsByIsbn("978-0132350884")).thenReturn(true);

        assertThrows(BusinessException.class, () -> bookService.createBook(request));
        verify(bookRepository, never()).save(any());
    }

    @Test
    @DisplayName("Should successfully create a new book")
    void shouldCreateBookSuccessfully() {
        BookRequestDTO request = BookRequestDTO.builder()
                .isbn("978-9999999999")
                .title("New Book")
                .author("New Author")
                .totalCopies(3)
                .build();

        when(bookRepository.existsByIsbn("978-9999999999")).thenReturn(false);
        when(bookMapper.toEntity(request)).thenReturn(sampleBook);
        when(bookRepository.save(sampleBook)).thenReturn(sampleBook);
        when(bookMapper.toResponseDTO(sampleBook)).thenReturn(sampleResponseDTO);

        BookResponseDTO result = bookService.createBook(request);

        assertNotNull(result);
        assertEquals("Clean Code", result.getTitle());
        verify(bookRepository, times(1)).save(sampleBook);
    }
}
