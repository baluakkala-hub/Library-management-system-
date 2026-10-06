package com.library.lms.controller;

import com.library.lms.dto.response.ApiResponse;
import com.library.lms.dto.response.BookRecommendationDTO;
import com.library.lms.service.TfIdfRecommenderService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/recommendations")
@RequiredArgsConstructor
@Tag(name = "AI Recommendations API", description = "Personalized book recommendations with explainable reasoning")
public class RecommendationController {

    private final TfIdfRecommenderService recommenderService;

    @GetMapping("/member/{memberId}")
    @Operation(summary = "Get personalized book recommendations for a member with explainability rationale")
    public ResponseEntity<ApiResponse<List<BookRecommendationDTO>>> getRecommendationsForMember(
            @PathVariable Long memberId,
            @RequestParam(defaultValue = "5") int limit) {
        List<BookRecommendationDTO> recommendations = recommenderService.getRecommendationsForMember(memberId, limit);
        return ResponseEntity.ok(ApiResponse.ok(recommendations, "Personalized recommendations generated successfully"));
    }

    @GetMapping("/cold-start")
    @Operation(summary = "Get cold-start recommendations based on ratings and popular foundation texts")
    public ResponseEntity<ApiResponse<List<BookRecommendationDTO>>> getColdStartRecommendations(
            @RequestParam(defaultValue = "5") int limit) {
        List<BookRecommendationDTO> recommendations = recommenderService.getColdStartRecommendations(limit);
        return ResponseEntity.ok(ApiResponse.ok(recommendations, "Cold-start recommendations generated successfully"));
    }

    @GetMapping("/book/{bookId}/similar")
    @Operation(summary = "Get content-similar books for a given book")
    public ResponseEntity<ApiResponse<List<BookRecommendationDTO>>> getSimilarBooks(
            @PathVariable Long bookId,
            @RequestParam(defaultValue = "4") int limit) {
        List<BookRecommendationDTO> similarBooks = recommenderService.getSimilarBooks(bookId, limit);
        return ResponseEntity.ok(ApiResponse.ok(similarBooks, "Similar titles retrieved successfully"));
    }
}
