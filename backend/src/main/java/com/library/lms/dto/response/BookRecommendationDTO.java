package com.library.lms.dto.response;

import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BookRecommendationDTO {
    private Long id;
    private String isbn;
    private String title;
    private String author;
    private String category;
    private Integer availableCopies;
    private Integer totalCopies;
    private Double averageRating;
    private Double similarityScore;
    private Integer matchPercentage;
    private String explanation;
    private List<String> matchFactors;
    private String aisle;
    private String shelf;
    private String columnRack;
}
