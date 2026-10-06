package com.library.lms.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "books")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 30)
    private String isbn;

    @Column(nullable = false, length = 150)
    private String title;

    @Column(nullable = false, length = 100)
    private String author;

    @Column(length = 50)
    private String category;

    @Column(name = "total_copies", nullable = false)
    private Integer totalCopies;

    @Column(name = "available_copies", nullable = false)
    private Integer availableCopies;

    @Column(length = 1500)
    private String description;

    @Column(length = 500)
    private String keywords;

    @Column(name = "publication_year")
    private Integer publicationYear;

    @Column(name = "average_rating")
    @Builder.Default
    private Double averageRating = 4.5;

    @Column(name = "ratings_count")
    @Builder.Default
    private Integer ratingsCount = 10;

    @Column(length = 50)
    private String aisle;

    @Column(length = 50)
    private String shelf;

    @Column(name = "column_rack", length = 50)
    private String columnRack;

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}
