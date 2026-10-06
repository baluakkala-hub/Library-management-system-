package com.library.lms.repository;

import com.library.lms.entity.Transaction;
import com.library.lms.entity.TransactionStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Long> {

    List<Transaction> findByStatus(TransactionStatus status);

    List<Transaction> findByMemberId(Long memberId);

    List<Transaction> findByBookId(Long bookId);

    long countByMemberIdAndStatus(Long memberId, TransactionStatus status);

    long countByStatus(TransactionStatus status);

    @Query("SELECT t FROM Transaction t WHERE t.status = 'ISSUED' AND t.dueDate < :currentDate")
    List<Transaction> findOverdueTransactions(LocalDate currentDate);

    @Query("SELECT COALESCE(SUM(t.fineAmount), 0) FROM Transaction t")
    BigDecimal sumTotalFines();
}
