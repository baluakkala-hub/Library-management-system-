package com.library.lms.repository;

import com.library.lms.entity.Reservation;
import com.library.lms.entity.ReservationStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {

    List<Reservation> findByStatus(ReservationStatus status);

    List<Reservation> findByBookId(Long bookId);

    List<Reservation> findByMemberId(Long memberId);

    Optional<Reservation> findFirstByBookIdAndStatusOrderByReservationDateAsc(Long bookId, ReservationStatus status);

    boolean existsByBookIdAndMemberIdAndStatus(Long bookId, Long memberId, ReservationStatus status);

    long countByBookIdAndStatus(Long bookId, ReservationStatus status);
}
