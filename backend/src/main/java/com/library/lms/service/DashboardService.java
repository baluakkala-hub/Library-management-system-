package com.library.lms.service;

import com.library.lms.dto.response.DashboardStatsDTO;
import com.library.lms.entity.MemberStatus;
import com.library.lms.entity.TransactionStatus;
import com.library.lms.repository.BookRepository;
import com.library.lms.repository.FineRepository;
import com.library.lms.repository.MemberRepository;
import com.library.lms.repository.TransactionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;

@Service
@RequiredArgsConstructor
public class DashboardService {

    private final BookRepository bookRepository;
    private final MemberRepository memberRepository;
    private final TransactionRepository transactionRepository;
    private final FineRepository fineRepository;
    @Transactional(readOnly = true)
    public DashboardStatsDTO getDashboardStats() {
        long totalBooks = bookRepository.sumTotalCopies();
        long availableBooks = bookRepository.sumAvailableCopies();
        long totalMembers = memberRepository.count();
        long activeMembers = memberRepository.countByStatus(MemberStatus.ACTIVE);
        long currentlyIssued = transactionRepository.countByStatus(TransactionStatus.ISSUED);
        long overdueCount = transactionRepository.findOverdueTransactions(LocalDate.now()).size();
        BigDecimal totalFines = transactionRepository.sumTotalFines();
        BigDecimal totalUnpaid = fineRepository.sumTotalUnpaidFines();
        BigDecimal totalPaid = fineRepository.sumTotalPaidFines();

        return DashboardStatsDTO.builder()
                .totalBooks(totalBooks)
                .totalAvailableBooks(availableBooks)
                .totalMembers(totalMembers)
                .activeMembers(activeMembers)
                .currentlyIssuedBooks(currentlyIssued)
                .overdueTransactions(overdueCount)
                .totalFinesAccrued(totalFines)
                .totalUnpaidFines(totalUnpaid)
                .totalPaidFines(totalPaid)
                .build();
    }
}
