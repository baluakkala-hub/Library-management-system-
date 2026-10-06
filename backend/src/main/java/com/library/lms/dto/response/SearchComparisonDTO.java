package com.library.lms.dto.response;

import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SearchComparisonDTO {
    private String query;
    private List<BookResponseDTO> keywordResults;
    private Long keywordLatencyMs;
    private Integer keywordCount;
    private List<SemanticSearchResponseDTO> semanticResults;
    private Long semanticLatencyMs;
    private Integer semanticCount;
    private String comparisonSummary;
}
