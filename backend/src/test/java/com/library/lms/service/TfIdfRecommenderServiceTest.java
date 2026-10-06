package com.library.lms.service;

import com.library.lms.dto.response.BookRecommendationDTO;
import com.library.lms.entity.Book;
import com.library.lms.entity.Member;
import com.library.lms.entity.MemberStatus;
import com.library.lms.entity.Transaction;
import com.library.lms.repository.BookRepository;
import com.library.lms.repository.MemberRepository;
import com.library.lms.repository.TransactionRepository;
import com.library.lms.service.TfIdfRecommenderService;
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
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class TfIdfRecommenderServiceTest {

    @Mock
    private BookRepository bookRepository;

    @Mock
    private MemberRepository memberRepository;

    @Mock
    private TransactionRepository transactionRepository;

    @InjectMocks
    private TfIdfRecommenderService recommenderService;

    private Member sampleMember;
    private Book bookJava;
    private Book bookCleanCode;
    private Book bookDeepLearning;

    @BeforeEach
    void setUp() {
        sampleMember = Member.builder()
                .id(1L)
                .name("Satish")
                .status(MemberStatus.ACTIVE)
                .build();

        bookJava = Book.builder()
                .id(1L)
                .title("Effective Java")
                .author("Joshua Bloch")
                .category("Programming")
                .keywords("java, best practices, concurrency, oop")
                .description("Guide to best practices in Java platform design")
                .availableCopies(3)
                .totalCopies(4)
                .averageRating(4.9)
                .build();

        bookCleanCode = Book.builder()
                .id(2L)
                .title("Clean Code")
                .author("Robert C. Martin")
                .category("Programming")
                .keywords("clean code, refactoring, best practices, agile")
                .description("Handbook of agile software craftsmanship")
                .availableCopies(4)
                .totalCopies(5)
                .averageRating(4.8)
                .build();

        bookDeepLearning = Book.builder()
                .id(3L)
                .title("Deep Learning")
                .author("Ian Goodfellow")
                .category("Artificial Intelligence")
                .keywords("neural networks, deep learning, backpropagation")
                .description("Textbook on neural networks and deep learning")
                .availableCopies(2)
                .totalCopies(2)
                .averageRating(4.8)
                .build();
    }

    @Test
    @DisplayName("Should generate explainable recommendations for student with history")
    void shouldGenerateRecommendationsWithExplanation() {
        Transaction tx = Transaction.builder()
                .id(10L)
                .book(bookJava)
                .member(sampleMember)
                .build();

        when(memberRepository.findById(1L)).thenReturn(Optional.of(sampleMember));
        when(bookRepository.findAll()).thenReturn(List.of(bookJava, bookCleanCode, bookDeepLearning));
        when(transactionRepository.findByMemberId(1L)).thenReturn(List.of(tx));

        List<BookRecommendationDTO> recs = recommenderService.getRecommendationsForMember(1L, 3);

        assertNotNull(recs);
        assertFalse(recs.isEmpty());

        BookRecommendationDTO topRec = recs.get(0);
        assertEquals("Clean Code", topRec.getTitle());
        assertTrue(topRec.getMatchPercentage() >= 40);
        assertNotNull(topRec.getExplanation());
        String exp = topRec.getExplanation().toLowerCase();
        assertTrue(exp.contains("programming") || exp.contains("recommended") || exp.contains("topic"));
    }

    @Test
    @DisplayName("Should handle cold-start member gracefully")
    void shouldHandleColdStartRecommendations() {
        when(memberRepository.findById(1L)).thenReturn(Optional.of(sampleMember));
        when(bookRepository.findAll()).thenReturn(List.of(bookJava, bookCleanCode));
        when(transactionRepository.findByMemberId(1L)).thenReturn(List.of());

        List<BookRecommendationDTO> recs = recommenderService.getRecommendationsForMember(1L, 2);

        assertNotNull(recs);
        assertEquals(2, recs.size());
        assertTrue(recs.get(0).getExplanation().toLowerCase().contains("starter") || recs.get(0).getExplanation().toLowerCase().contains("popular"));
    }
}
