package com.library.lms.controller;

import com.library.lms.dto.response.ApiResponse;
import com.library.lms.dto.response.SimulationResponseDTO;
import com.library.lms.service.SimulationService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/simulation")
@RequiredArgsConstructor
@Tag(name = "Borrowing Simulation API", description = "Endpoints for simulating student borrowing activity, interest profiles, and ID deactivation")
public class SimulationController {

    private final SimulationService simulationService;

    @GetMapping("/status")
    @Operation(summary = "Get current borrowing simulation telemetry and student interest profiles")
    public ResponseEntity<ApiResponse<SimulationResponseDTO>> getStatus() {
        SimulationResponseDTO status = simulationService.getSimulationStatus();
        return ResponseEntity.ok(ApiResponse.ok(status));
    }

    @PostMapping("/run")
    @Operation(summary = "Execute automated student borrowing simulation and non-borrower ID deactivation")
    public ResponseEntity<ApiResponse<SimulationResponseDTO>> runSimulation() {
        SimulationResponseDTO result = simulationService.runSimulation();
        return ResponseEntity.ok(ApiResponse.ok(result, "Student borrowing simulation executed successfully"));
    }
}
