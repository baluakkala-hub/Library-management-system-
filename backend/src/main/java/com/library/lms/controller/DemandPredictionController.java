package com.library.lms.controller;

import com.library.lms.dto.response.ApiResponse;
import com.library.lms.dto.response.DemandForecastDTO;
import com.library.lms.service.DemandForecastingService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/demand")
@RequiredArgsConstructor
@Tag(name = "Demand Forecasting API", description = "Machine learning predictive analytics for book and category demand")
public class DemandPredictionController {

    private final DemandForecastingService demandService;

    @GetMapping("/categories")
    @Operation(summary = "Get monthly demand forecasts across all book categories")
    public ResponseEntity<ApiResponse<List<DemandForecastDTO>>> getCategoryForecasts() {
        return ResponseEntity.ok(ApiResponse.ok(demandService.getCategoryDemandForecasts()));
    }

    @GetMapping("/books")
    @Operation(summary = "Get individual book demand forecasts and stress ratios")
    public ResponseEntity<ApiResponse<List<DemandForecastDTO>>> getBookForecasts() {
        return ResponseEntity.ok(ApiResponse.ok(demandService.getBookDemandForecasts()));
    }

    @GetMapping("/shortage-advisories")
    @Operation(summary = "Get inventory shortage warnings and procurement copy suggestions")
    public ResponseEntity<ApiResponse<List<DemandForecastDTO>>> getShortageAdvisories() {
        return ResponseEntity.ok(ApiResponse.ok(demandService.getStockShortageAdvisories()));
    }

    @GetMapping("/accuracy")
    @Operation(summary = "Get model error evaluation metrics (MAE, MSE, RMSE)")
    public ResponseEntity<ApiResponse<Map<String, Double>>> getAccuracyMetrics() {
        return ResponseEntity.ok(ApiResponse.ok(demandService.getModelAccuracyMetrics()));
    }
}
