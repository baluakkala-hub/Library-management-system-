package com.library.lms.service;

import com.library.lms.dto.request.IssueRequestDTO;
import com.library.lms.dto.response.TransactionResponseDTO;
import com.library.lms.entity.*;
import com.library.lms.exception.BusinessException;
import com.library.lms.mapper.TransactionMapper;
import com.library.lms.repository.BookRepository;
import com.library.lms.repository.FineRepository;
import com.library.lms.repository.MemberRepository;
import com.library.lms.repository.TransactionRepository;
import com.library.lms.service.TransactionService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class TransactionServiceTest {

    @Mock
    private TransactionRepository transactionRepository;

    @Mock
    private BookRepository bookRepository;

    @Mock
    private MemberRepository memberRepository;

    @Mock
    private FineRepository fineRepository;

    @Mock
    private TransactionMapper transactionMapper;

    @InjectMocks
    private TransactionService transactionService;

    private Book sampleBook;
    private Member activeMember;

    @BeforeEach
    void setUp() {
        sampleBook = Book.builder()
                .id(1L)
                .title("Clean Code")
                .availableCopies(3)
                .totalCopies(3)
                .build();

        activeMember = Member.builder()
                .id(1L)
                .name("Satish")
                .email("satish@university.edu")
                .status(MemberStatus.ACTIVE)
                .build();
    }

    @Test
    @DisplayName("Should block book issue when member has unpaid fines")
    void shouldBlockIssueWhenMemberHasUnpaidFines() {
        IssueRequestDTO request = new IssueRequestDTO(1L, 1L, 14);

        when(bookRepository.findById(1L)).thenReturn(Optional.of(sampleBook));
        when(memberRepository.findById(1L)).thenReturn(Optional.of(activeMember));
        when(fineRepository.countByMemberIdAndStatus(1L, FineStatus.UNPAID)).thenReturn(1L);
        when(fineRepository.sumUnpaidFinesByMemberId(1L)).thenReturn(new BigDecimal("5.00"));

        BusinessException ex = assertThrows(BusinessException.class, () -> transactionService.issueBook(request));
        assertTrue(ex.getMessage().contains("unpaid fine"));
        verify(bookRepository, never()).save(any());
    }

    @Test
    @DisplayName("Should block book issue when available copies is 0")
    void shouldBlockIssueWhenOutOfStock() {
        sampleBook.setAvailableCopies(0);
        IssueRequestDTO request = new IssueRequestDTO(1L, 1L, 14);

        when(bookRepository.findById(1L)).thenReturn(Optional.of(sampleBook));
        when(memberRepository.findById(1L)).thenReturn(Optional.of(activeMember));
        when(fineRepository.countByMemberIdAndStatus(1L, FineStatus.UNPAID)).thenReturn(0L);
        when(transactionRepository.countByMemberIdAndStatus(1L, TransactionStatus.ISSUED)).thenReturn(0L);

        BusinessException ex = assertThrows(BusinessException.class, () -> transactionService.issueBook(request));
        assertTrue(ex.getMessage().contains("out of stock"));
    }

    @Test
    @DisplayName("Should issue book successfully when all rules pass")
    void shouldIssueBookSuccessfully() {
        IssueRequestDTO request = new IssueRequestDTO(1L, 1L, 14);
        Transaction savedTx = Transaction.builder()
                .id(100L)
                .book(sampleBook)
                .member(activeMember)
                .issueDate(LocalDate.now())
                .dueDate(LocalDate.now().plusDays(14))
                .status(TransactionStatus.ISSUED)
                .build();

        TransactionResponseDTO responseDTO = TransactionResponseDTO.builder()
                .id(100L)
                .bookTitle("Clean Code")
                .memberName("Satish")
                .status(TransactionStatus.ISSUED)
                .build();

        when(bookRepository.findById(1L)).thenReturn(Optional.of(sampleBook));
        when(memberRepository.findById(1L)).thenReturn(Optional.of(activeMember));
        when(fineRepository.countByMemberIdAndStatus(1L, FineStatus.UNPAID)).thenReturn(0L);
        when(transactionRepository.countByMemberIdAndStatus(1L, TransactionStatus.ISSUED)).thenReturn(0L);
        when(transactionRepository.save(any(Transaction.class))).thenReturn(savedTx);
        when(transactionMapper.toResponseDTO(savedTx)).thenReturn(responseDTO);

        TransactionResponseDTO result = transactionService.issueBook(request);

        assertNotNull(result);
        assertEquals(2, sampleBook.getAvailableCopies()); // Decremented by 1
        verify(bookRepository, times(1)).save(sampleBook);
        verify(transactionRepository, times(1)).save(any(Transaction.class));
    }
}
