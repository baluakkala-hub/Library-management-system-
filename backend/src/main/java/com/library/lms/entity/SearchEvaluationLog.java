package com.library.lms.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "search_eval_logs")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SearchEvaluationLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 255)
    private String query;

    @Column(name = "search_mode", nullable = false, length = 30)
    private String searchMode; // "KEYWORD" vs "SEMANTIC"

    @Column(name = "execution_time_ms", nullable = false)
    private Long executionTimeMs;

    @Column(name = "results_count", nullable = false)
    private Integer resultsCount;

    @Column(name = "top_matched_book", length = 200)
    private String topMatchedBook;

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;
}
