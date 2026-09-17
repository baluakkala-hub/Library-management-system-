package com.library.lms.dto.response;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResearchBenchmarkDTO {
    private Double averageKeywordLatencyMs;
    private Double averageSemanticLatencyMs;
    private Double latencySpeedupFactor;
    private Double recommendationPrecisionAt3;
    private Double recommendationRecallAt3;
    private Double meanReciprocalRank;
    private Double demandPredictionMae;
    private Double demandPredictionRmse;
    private Long totalQueriesEvaluated;
    private Long totalRecommendationsServed;
    private LocalDateTime evaluationTimestamp;
}
