package com.library.lms.controller;

import com.library.lms.dto.request.BookRequestDTO;
import com.library.lms.dto.response.ApiResponse;
import com.library.lms.dto.response.BookResponseDTO;
import com.library.lms.dto.response.PageResponseDTO;
import com.library.lms.service.BookService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/books")
@RequiredArgsConstructor
@Tag(name = "Books API", description = "Endpoints for managing book inventory")
public class BookController {

    private final BookService bookService;

    @GetMapping
    @Operation(summary = "Get all books or filter by search query")
    public ResponseEntity<ApiResponse<List<BookResponseDTO>>> getBooks(
            @RequestParam(required = false) String search) {
        List<BookResponseDTO> books = (search != null && !search.isBlank())
                ? bookService.searchBooks(search)
                : bookService.getAllBooks();
        return ResponseEntity.ok(ApiResponse.ok(books));
    }

    @GetMapping("/paged")
    @Operation(summary = "Get books with server-side pagination and sorting")
    public ResponseEntity<ApiResponse<PageResponseDTO<BookResponseDTO>>> getPagedBooks(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size,
            @RequestParam(defaultValue = "title") String sortBy,
            @RequestParam(defaultValue = "asc") String direction) {
        PageResponseDTO<BookResponseDTO> pagedBooks = bookService.getPagedBooks(page, size, sortBy, direction);
        return ResponseEntity.ok(ApiResponse.ok(pagedBooks));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get a book by ID")
    public ResponseEntity<ApiResponse<BookResponseDTO>> getBookById(@PathVariable Long id) {
        return ResponseEntity.ok(ApiResponse.ok(bookService.getBookById(id)));
    }

    @PostMapping
    @Operation(summary = "Create a new book")
    public ResponseEntity<ApiResponse<BookResponseDTO>> createBook(
            @Valid @RequestBody BookRequestDTO request) {
        BookResponseDTO createdBook = bookService.createBook(request);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.ok(createdBook, "Book created successfully"));
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update an existing book")
    public ResponseEntity<ApiResponse<BookResponseDTO>> updateBook(
            @PathVariable Long id,
            @Valid @RequestBody BookRequestDTO request) {
        BookResponseDTO updatedBook = bookService.updateBook(id, request);
        return ResponseEntity.ok(ApiResponse.ok(updatedBook, "Book updated successfully"));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete a book by ID")
    public ResponseEntity<ApiResponse<Void>> deleteBook(@PathVariable Long id) {
        bookService.deleteBook(id);
        return ResponseEntity.ok(ApiResponse.ok(null, "Book deleted successfully"));
    }
}
