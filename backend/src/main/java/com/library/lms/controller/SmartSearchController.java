package com.library.lms.controller;

import com.library.lms.dto.response.ApiResponse;
import com.library.lms.dto.response.SearchComparisonDTO;
import com.library.lms.dto.response.SemanticSearchResponseDTO;
import com.library.lms.service.SemanticSearchService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/search")
@RequiredArgsConstructor
@Tag(name = "Smart Search API", description = "Natural-language semantic book search and comparative benchmarking")
public class SmartSearchController {

    private final SemanticSearchService searchService;

    @GetMapping("/semantic")
    @Operation(summary = "Search books using natural language / semantic query")
    public ResponseEntity<ApiResponse<List<SemanticSearchResponseDTO>>> searchSemantic(
            @RequestParam String query,
            @RequestParam(defaultValue = "10") int limit) {
        List<SemanticSearchResponseDTO> results = searchService.searchSemantic(query, limit);
        return ResponseEntity.ok(ApiResponse.ok(results, "Semantic search executed successfully"));
    }

    @GetMapping("/compare")
    @Operation(summary = "Compare traditional keyword search vs semantic AI search side-by-side")
    public ResponseEntity<ApiResponse<SearchComparisonDTO>> compareSearch(
            @RequestParam String query) {
        SearchComparisonDTO comparison = searchService.compareSearchModes(query);
        return ResponseEntity.ok(ApiResponse.ok(comparison, "Search comparison generated successfully"));
    }
}
