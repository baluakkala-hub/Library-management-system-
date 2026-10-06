package com.library.lms.dto.response;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BookResponseDTO {

    private Long id;
    private String isbn;
    private String title;
    private String author;
    private String category;
    private Integer totalCopies;
    private Integer availableCopies;
    private String description;
    private String keywords;
    private Integer publicationYear;
    private Double averageRating;
    private Integer ratingsCount;
    private String aisle;
    private String shelf;
    private String columnRack;
    private LocalDateTime createdAt;
}
