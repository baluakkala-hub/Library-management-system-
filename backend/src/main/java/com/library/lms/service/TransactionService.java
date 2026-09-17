package com.library.lms.service;

import com.library.lms.dto.request.IssueRequestDTO;
import com.library.lms.dto.response.TransactionResponseDTO;
import com.library.lms.entity.*;
import com.library.lms.exception.BusinessException;
import com.library.lms.exception.ResourceNotFoundException;
import com.library.lms.mapper.TransactionMapper;
import com.library.lms.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TransactionService {

    private static final int MAX_BOOKS_PER_MEMBER = 3;
    private static final int DEFAULT_LOAN_DAYS = 14;
    private static final BigDecimal DAILY_FINE_RATE = new BigDecimal("1.00");

    private final TransactionRepository transactionRepository;
    private final BookRepository bookRepository;
    private final MemberRepository memberRepository;
    private final FineRepository fineRepository;
    private final ReservationRepository reservationRepository;
    private final TransactionMapper transactionMapper;
    @Transactional
    public TransactionResponseDTO issueBook(IssueRequestDTO request) {
        Book book = bookRepository.findById(request.getBookId())
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with id: " + request.getBookId()));

        Member member = memberRepository.findById(request.getMemberId())
                .orElseThrow(() -> new ResourceNotFoundException("Member not found with id: " + request.getMemberId()));

        // Business Rule 1: Member must be active
        if (member.getStatus() != MemberStatus.ACTIVE) {
            throw new BusinessException("Member status is " + member.getStatus() + ". Only ACTIVE members can borrow books.");
        }

        // Business Rule 2: Unpaid fines check
        long unpaidFinesCount = fineRepository.countByMemberIdAndStatus(member.getId(), FineStatus.UNPAID);
        if (unpaidFinesCount > 0) {
            BigDecimal unpaidTotal = fineRepository.sumUnpaidFinesByMemberId(member.getId());
            throw new BusinessException("Borrowing blocked: Member has " + unpaidFinesCount 
                    + " unpaid fine(s) totaling $" + unpaidTotal.setScale(2) + ". Fines must be cleared first.");
        }

        // Business Rule 3: Member max loan limit
        long activeLoans = transactionRepository.countByMemberIdAndStatus(member.getId(), TransactionStatus.ISSUED);
        if (activeLoans >= MAX_BOOKS_PER_MEMBER) {
            throw new BusinessException("Member has reached the maximum allowed limit of " + MAX_BOOKS_PER_MEMBER + " borrowed books.");
        }

        // Business Rule 4: Book stock check
        if (book.getAvailableCopies() <= 0) {
            throw new BusinessException("Book '" + book.getTitle() + "' is currently out of stock.");
        }

        // Decrement available copies
        book.setAvailableCopies(book.getAvailableCopies() - 1);
        bookRepository.save(book);

        int loanDuration = (request.getLoanDays() != null && request.getLoanDays() > 0)
                ? request.getLoanDays()
                : DEFAULT_LOAN_DAYS;

        LocalDate issueDate = LocalDate.now();
        LocalDate dueDate = issueDate.plusDays(loanDuration);

        Transaction transaction = Transaction.builder()
                .book(book)
                .member(member)
                .issueDate(issueDate)
                .dueDate(dueDate)
                .status(TransactionStatus.ISSUED)
                .fineAmount(BigDecimal.ZERO)
                .build();

        Transaction savedTransaction = transactionRepository.save(transaction);
        return transactionMapper.toResponseDTO(savedTransaction);
    }
    @Transactional
    public TransactionResponseDTO returnBook(Long transactionId) {
        Transaction transaction = transactionRepository.findById(transactionId)
                .orElseThrow(() -> new ResourceNotFoundException("Transaction not found with id: " + transactionId));

        if (transaction.getStatus() == TransactionStatus.RETURNED) {
            throw new BusinessException("This book transaction has already been marked as returned.");
        }

        LocalDate returnDate = LocalDate.now();
        transaction.setReturnDate(returnDate);
        transaction.setStatus(TransactionStatus.RETURNED);

        // Fine calculation
        if (returnDate.isAfter(transaction.getDueDate())) {
            long overdueDays = ChronoUnit.DAYS.between(transaction.getDueDate(), returnDate);
            BigDecimal fineAmount = DAILY_FINE_RATE.multiply(BigDecimal.valueOf(overdueDays));
            transaction.setFineAmount(fineAmount);

            // Automatically create an UNPAID fine record for settlement tracking
            Fine fine = Fine.builder()
                    .transaction(transaction)
                    .member(transaction.getMember())
                    .amount(fineAmount)
                    .status(FineStatus.UNPAID)
                    .build();
            fineRepository.save(fine);
        } else {
            transaction.setFineAmount(BigDecimal.ZERO);
        }

        // Increment book available copies
        Book book = transaction.getBook();
        book.setAvailableCopies(Math.min(book.getTotalCopies(), book.getAvailableCopies() + 1));
        bookRepository.save(book);

        // Advance waitlist: fulfill pending reservation if any
        reservationRepository.findFirstByBookIdAndStatusOrderByReservationDateAsc(book.getId(), ReservationStatus.PENDING)
                .ifPresent(reservation -> {
                    reservation.setStatus(ReservationStatus.FULFILLED);
                    reservation.setFulfillmentDate(LocalDate.now());
                    reservationRepository.save(reservation);
                });

        Transaction updatedTransaction = transactionRepository.save(transaction);
        return transactionMapper.toResponseDTO(updatedTransaction);
    }
    @Transactional(readOnly = true)
    public List<TransactionResponseDTO> getAllTransactions() {
        return transactionRepository.findAll().stream()
                .map(transactionMapper::toResponseDTO)
                .collect(Collectors.toList());
    }
    @Transactional(readOnly = true)
    public List<TransactionResponseDTO> getActiveTransactions() {
        return transactionRepository.findByStatus(TransactionStatus.ISSUED).stream()
                .map(transactionMapper::toResponseDTO)
                .collect(Collectors.toList());
    }
    @Transactional(readOnly = true)
    public List<TransactionResponseDTO> getOverdueTransactions() {
        return transactionRepository.findOverdueTransactions(LocalDate.now()).stream()
                .map(transactionMapper::toResponseDTO)
                .collect(Collectors.toList());
    }
    @Transactional(readOnly = true)
    public List<TransactionResponseDTO> getTransactionsByMember(Long memberId) {
        return transactionRepository.findByMemberId(memberId).stream()
                .map(transactionMapper::toResponseDTO)
                .collect(Collectors.toList());
    }
}
