package com.library.lms.dto.response;

import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SemanticSearchResponseDTO {
    private Long id;
    private String isbn;
    private String title;
    private String author;
    private String category;
    private Integer availableCopies;
    private Integer totalCopies;
    private String description;
    private Double relevanceScore;
    private Integer relevancePercentage;
    private List<String> matchedKeywords;
    private String searchMode; // "SEMANTIC"
    private String matchRationale;
    private String aisle;
    private String shelf;
    private String columnRack;
}
