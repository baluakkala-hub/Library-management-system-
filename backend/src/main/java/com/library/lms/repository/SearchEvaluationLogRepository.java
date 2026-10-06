package com.library.lms.repository;

import com.library.lms.entity.SearchEvaluationLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SearchEvaluationLogRepository extends JpaRepository<SearchEvaluationLog, Long> {

    List<SearchEvaluationLog> findTop50ByOrderByCreatedAtDesc();

    @Query("SELECT AVG(s.executionTimeMs) FROM SearchEvaluationLog s WHERE s.searchMode = 'KEYWORD'")
    Double getAverageKeywordSearchLatency();

    @Query("SELECT AVG(s.executionTimeMs) FROM SearchEvaluationLog s WHERE s.searchMode = 'SEMANTIC'")
    Double getAverageSemanticSearchLatency();

    long countBySearchMode(String searchMode);
}
