package com.library.lms.repository;

import com.library.lms.entity.Fine;
import com.library.lms.entity.FineStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface FineRepository extends JpaRepository<Fine, Long> {

    List<Fine> findByStatus(FineStatus status);

    List<Fine> findByMemberId(Long memberId);

    List<Fine> findByMemberIdAndStatus(Long memberId, FineStatus status);

    long countByMemberIdAndStatus(Long memberId, FineStatus status);

    @Query("SELECT COALESCE(SUM(f.amount), 0) FROM Fine f WHERE f.member.id = :memberId AND f.status = 'UNPAID'")
    BigDecimal sumUnpaidFinesByMemberId(@Param("memberId") Long memberId);

    @Query("SELECT COALESCE(SUM(f.amount), 0) FROM Fine f WHERE f.status = 'PAID'")
    BigDecimal sumTotalPaidFines();

    @Query("SELECT COALESCE(SUM(f.amount), 0) FROM Fine f WHERE f.status = 'UNPAID'")
    BigDecimal sumTotalUnpaidFines();
}
