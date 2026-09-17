package com.library.lms.service;

import com.library.lms.dto.response.SearchComparisonDTO;
import com.library.lms.dto.response.SemanticSearchResponseDTO;
import com.library.lms.entity.Book;
import com.library.lms.mapper.BookMapper;
import com.library.lms.repository.BookRepository;
import com.library.lms.repository.SearchEvaluationLogRepository;
import com.library.lms.service.SemanticSearchService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class SemanticSearchServiceTest {

    @Mock
    private BookRepository bookRepository;

    @Mock
    private SearchEvaluationLogRepository logRepository;

    @Mock
    private BookMapper bookMapper;

    @InjectMocks
    private SemanticSearchService searchService;

    private Book bookML;
    private Book bookJava;

    @BeforeEach
    void setUp() {
        bookML = Book.builder()
                .id(1L)
                .title("Hands-On Machine Learning")
                .author("Aurelien Geron")
                .category("Artificial Intelligence")
                .keywords("beginner-friendly, machine learning, neural networks, deep learning")
                .description("A beginner-friendly practical guide to building neural networks")
                .totalCopies(3)
                .availableCopies(3)
                .build();

        bookJava = Book.builder()
                .id(2L)
                .title("Effective Java")
                .author("Joshua Bloch")
                .category("Programming")
                .keywords("java, oop, best practices")
                .description("Best practices for the Java platform")
                .totalCopies(4)
                .availableCopies(4)
                .build();
    }

    @Test
    @DisplayName("Should find books by conversational natural language query via concept expansion")
    void shouldFindBooksByConversationalQuery() {
        when(bookRepository.findAll()).thenReturn(List.of(bookML, bookJava));

        List<SemanticSearchResponseDTO> results = searchService.searchSemantic("I need a beginner-friendly book about neural networks", 5);

        assertNotNull(results);
        assertFalse(results.isEmpty());
        assertEquals("Hands-On Machine Learning", results.get(0).getTitle());
        assertTrue(results.get(0).getRelevancePercentage() >= 30);
        assertNotNull(results.get(0).getMatchRationale());
    }

    @Test
    @DisplayName("Should compare keyword vs semantic search side-by-side")
    void shouldCompareSearchModes() {
        when(bookRepository.searchBooks(anyString())).thenReturn(List.of());
        when(bookRepository.findAll()).thenReturn(List.of(bookML, bookJava));

        SearchComparisonDTO comparison = searchService.compareSearchModes("I need a book about neural networks");

        assertNotNull(comparison);
        assertEquals(0, comparison.getKeywordCount());
        assertTrue(comparison.getSemanticCount() >= 1);
        assertNotNull(comparison.getComparisonSummary());
    }
}
