package com.library.lms.controller;

import com.library.lms.dto.response.ApiResponse;
import com.library.lms.dto.response.ResearchBenchmarkDTO;
import com.library.lms.service.ResearchEvaluationService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@RequestMapping("/api/research")
@RequiredArgsConstructor
@Tag(name = "IEEE Research Benchmarking API", description = "Collects and exports evaluation metrics for research paper tables")
public class ResearchEvaluationController {

    private final ResearchEvaluationService researchService;

    @GetMapping("/benchmark")
    @Operation(summary = "Get aggregated IEEE scientific evaluation metrics (Latency, Precision@K, MAE, RMSE)")
    public ResponseEntity<ApiResponse<ResearchBenchmarkDTO>> getBenchmark() {
        return ResponseEntity.ok(ApiResponse.ok(researchService.getBenchmarkSummary()));
    }

    @GetMapping("/export/csv")
    @Operation(summary = "Export full IEEE benchmark dataset and query logs as CSV file")
    public void exportCsv(HttpServletResponse response) throws IOException {
        researchService.exportBenchmarkCsv(response);
    }
}
