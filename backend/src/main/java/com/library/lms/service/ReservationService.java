package com.library.lms.service;

import com.library.lms.dto.request.ReservationRequestDTO;
import com.library.lms.dto.response.ReservationResponseDTO;
import com.library.lms.entity.*;
import com.library.lms.exception.BusinessException;
import com.library.lms.exception.ResourceNotFoundException;
import com.library.lms.mapper.ReservationMapper;
import com.library.lms.repository.BookRepository;
import com.library.lms.repository.MemberRepository;
import com.library.lms.repository.ReservationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ReservationService {

    private final ReservationRepository reservationRepository;
    private final BookRepository bookRepository;
    private final MemberRepository memberRepository;
    private final ReservationMapper reservationMapper;
    @Transactional
    public ReservationResponseDTO createReservation(ReservationRequestDTO request) {
        Book book = bookRepository.findById(request.getBookId())
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with id: " + request.getBookId()));

        Member member = memberRepository.findById(request.getMemberId())
                .orElseThrow(() -> new ResourceNotFoundException("Member not found with id: " + request.getMemberId()));

        if (member.getStatus() != MemberStatus.ACTIVE) {
            throw new BusinessException("Only ACTIVE members can place reservations.");
        }

        // Rule: Only reserve if out of stock
        if (book.getAvailableCopies() > 0) {
            throw new BusinessException("Book '" + book.getTitle() + "' is currently in stock (" 
                    + book.getAvailableCopies() + " available). You can issue it directly instead of reserving.");
        }

        // Rule: Check duplicate active hold
        if (reservationRepository.existsByBookIdAndMemberIdAndStatus(book.getId(), member.getId(), ReservationStatus.PENDING)) {
            throw new BusinessException("Member already has an active pending hold for this book.");
        }

        Reservation reservation = Reservation.builder()
                .book(book)
                .member(member)
                .reservationDate(LocalDate.now())
                .status(ReservationStatus.PENDING)
                .build();

        Reservation savedReservation = reservationRepository.save(reservation);
        return reservationMapper.toResponseDTO(savedReservation);
    }
    @Transactional
    public ReservationResponseDTO cancelReservation(Long id) {
        Reservation reservation = reservationRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Reservation not found with id: " + id));

        if (reservation.getStatus() != ReservationStatus.PENDING) {
            throw new BusinessException("Only PENDING reservations can be cancelled.");
        }

        reservation.setStatus(ReservationStatus.CANCELLED);
        Reservation updated = reservationRepository.save(reservation);
        return reservationMapper.toResponseDTO(updated);
    }
    @Transactional(readOnly = true)
    public List<ReservationResponseDTO> getAllReservations() {
        return reservationRepository.findAll().stream()
                .map(reservationMapper::toResponseDTO)
                .collect(Collectors.toList());
    }
    @Transactional(readOnly = true)
    public List<ReservationResponseDTO> getPendingReservations() {
        return reservationRepository.findByStatus(ReservationStatus.PENDING).stream()
                .map(reservationMapper::toResponseDTO)
                .collect(Collectors.toList());
    }
    @Transactional(readOnly = true)
    public List<ReservationResponseDTO> getReservationsByMember(Long memberId) {
        return reservationRepository.findByMemberId(memberId).stream()
                .map(reservationMapper::toResponseDTO)
                .collect(Collectors.toList());
    }
}
