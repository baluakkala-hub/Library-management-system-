package com.library.lms.controller;

import com.library.lms.dto.request.PayFineRequestDTO;
import com.library.lms.dto.response.ApiResponse;
import com.library.lms.dto.response.FineResponseDTO;
import com.library.lms.service.FineService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/fines")
@RequiredArgsConstructor
@Tag(name = "Fines API", description = "Endpoints for managing overdue fines and settlement payments")
public class FineController {

    private final FineService fineService;

    @GetMapping
    @Operation(summary = "Get all fines history")
    public ResponseEntity<ApiResponse<List<FineResponseDTO>>> getAllFines() {
        return ResponseEntity.ok(ApiResponse.ok(fineService.getAllFines()));
    }

    @GetMapping("/unpaid")
    @Operation(summary = "Get all outstanding unpaid fines")
    public ResponseEntity<ApiResponse<List<FineResponseDTO>>> getUnpaidFines() {
        return ResponseEntity.ok(ApiResponse.ok(fineService.getUnpaidFines()));
    }

    @GetMapping("/member/{memberId}")
    @Operation(summary = "Get fines for a specific member")
    public ResponseEntity<ApiResponse<List<FineResponseDTO>>> getFinesByMember(@PathVariable Long memberId) {
        return ResponseEntity.ok(ApiResponse.ok(fineService.getFinesByMember(memberId)));
    }

    @PostMapping("/{id}/pay")
    @Operation(summary = "Settle / pay an outstanding fine")
    public ResponseEntity<ApiResponse<FineResponseDTO>> payFine(
            @PathVariable Long id,
            @Valid @RequestBody PayFineRequestDTO request) {
        FineResponseDTO updatedFine = fineService.payFine(id, request);
        return ResponseEntity.ok(ApiResponse.ok(updatedFine, "Fine settled successfully"));
    }
}
