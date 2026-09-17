package com.library.lms.dto.response;

import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DemandForecastDTO {
    private String itemKey; // Category name or Book title
    private String category;
    private Integer currentTotalCopies;
    private Integer currentAvailableCopies;
    private Long historicalBorrowCount;
    private Double predictedMonthlyDemand;
    private String demandTrend; // "SURGING", "MODERATE", "STABLE", "LOW"
    private Double stressRatio;
    private String riskLevel; // "HIGH", "MEDIUM", "LOW"
    private Integer suggestedCopiesToOrder;
    private String explanation;
    private List<Double> monthlyHistory;
}
