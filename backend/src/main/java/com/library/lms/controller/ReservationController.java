package com.library.lms.controller;

import com.library.lms.dto.request.ReservationRequestDTO;
import com.library.lms.dto.response.ApiResponse;
import com.library.lms.dto.response.ReservationResponseDTO;
import com.library.lms.service.ReservationService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/reservations")
@RequiredArgsConstructor
@Tag(name = "Reservations API", description = "Endpoints for managing book hold queues and waitlists")
public class ReservationController {

    private final ReservationService reservationService;

    @GetMapping
    @Operation(summary = "Get all reservations history")
    public ResponseEntity<ApiResponse<List<ReservationResponseDTO>>> getAllReservations() {
        return ResponseEntity.ok(ApiResponse.ok(reservationService.getAllReservations()));
    }

    @GetMapping("/pending")
    @Operation(summary = "Get active pending waitlist holds")
    public ResponseEntity<ApiResponse<List<ReservationResponseDTO>>> getPendingReservations() {
        return ResponseEntity.ok(ApiResponse.ok(reservationService.getPendingReservations()));
    }

    @GetMapping("/member/{memberId}")
    @Operation(summary = "Get reservations for a specific member")
    public ResponseEntity<ApiResponse<List<ReservationResponseDTO>>> getReservationsByMember(@PathVariable Long memberId) {
        return ResponseEntity.ok(ApiResponse.ok(reservationService.getReservationsByMember(memberId)));
    }

    @PostMapping
    @Operation(summary = "Place a hold/reservation on an out-of-stock book")
    public ResponseEntity<ApiResponse<ReservationResponseDTO>> createReservation(
            @Valid @RequestBody ReservationRequestDTO request) {
        ReservationResponseDTO response = reservationService.createReservation(request);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.ok(response, "Book reservation placed successfully. You are in queue."));
    }

    @PostMapping("/{id}/cancel")
    @Operation(summary = "Cancel an active reservation hold")
    public ResponseEntity<ApiResponse<ReservationResponseDTO>> cancelReservation(@PathVariable Long id) {
        ReservationResponseDTO response = reservationService.cancelReservation(id);
        return ResponseEntity.ok(ApiResponse.ok(response, "Reservation cancelled successfully."));
    }
}
