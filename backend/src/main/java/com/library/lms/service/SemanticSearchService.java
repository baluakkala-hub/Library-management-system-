package com.library.lms.service;

import com.library.lms.dto.response.BookResponseDTO;
import com.library.lms.dto.response.SearchComparisonDTO;
import com.library.lms.dto.response.SemanticSearchResponseDTO;
import com.library.lms.entity.Book;
import com.library.lms.entity.SearchEvaluationLog;
import com.library.lms.mapper.BookMapper;
import com.library.lms.repository.BookRepository;
import com.library.lms.repository.SearchEvaluationLogRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SemanticSearchService {

    private final BookRepository bookRepository;
    private final SearchEvaluationLogRepository logRepository;
    private final BookMapper bookMapper;

    // Conversational stop words to prune
    private static final Set<String> QUERY_STOP_WORDS = Set.of(
            "i", "me", "my", "we", "need", "want", "looking", "for", "a", "an", "the", "book", "books",
            "about", "on", "please", "can", "you", "give", "show", "find", "suggest", "recommend",
            "some", "good", "best", "any", "related", "to", "with", "in", "of", "and"
    );

    // Concept & Domain Thesaurus for Semantic Expansion
    private static final Map<String, List<String>> CONCEPT_THESAURUS = new HashMap<>();

    static {
        CONCEPT_THESAURUS.put("neural", List.of("deep learning", "artificial intelligence", "machine learning", "backpropagation", "perceptron"));
        CONCEPT_THESAURUS.put("neural networks", List.of("deep learning", "artificial intelligence", "machine learning", "convolutional", "transformer"));
        CONCEPT_THESAURUS.put("deep learning", List.of("neural networks", "machine learning", "computer vision", "nlp", "ai"));
        CONCEPT_THESAURUS.put("ai", List.of("artificial intelligence", "machine learning", "deep learning", "expert systems"));
        CONCEPT_THESAURUS.put("machine learning", List.of("supervised learning", "regression", "classification", "clustering", "ai"));
        CONCEPT_THESAURUS.put("beginner", List.of("introduction", "fundamentals", "basics", "starter", "guide", "clean", "easy", "head first"));
        CONCEPT_THESAURUS.put("beginner-friendly", List.of("introduction", "fundamentals", "basics", "starter", "head first", "clean code"));
        CONCEPT_THESAURUS.put("architecture", List.of("design patterns", "clean architecture", "domain-driven", "microservices", "system design"));
        CONCEPT_THESAURUS.put("patterns", List.of("design patterns", "gang of four", "creational", "structural", "behavioral", "refactoring"));
        CONCEPT_THESAURUS.put("distributed", List.of("distributed systems", "fault tolerance", "consensus", "replication", "scalability", "cloud"));
        CONCEPT_THESAURUS.put("database", List.of("sql", "nosql", "acid", "transactions", "data-intensive", "storage", "indexing"));
        CONCEPT_THESAURUS.put("algorithms", List.of("data structures", "sorting", "graphs", "trees", "dynamic programming", "complexity", "big-o"));
        CONCEPT_THESAURUS.put("clean", List.of("clean code", "craftsmanship", "refactoring", "maintainable", "best practices"));
    }
    @Transactional
    public List<SemanticSearchResponseDTO> searchSemantic(String rawQuery, int limit) {
        long startTime = System.currentTimeMillis();

        if (rawQuery == null || rawQuery.trim().isBlank()) {
            return Collections.emptyList();
        }

        String queryLower = rawQuery.toLowerCase().trim();
        List<String> queryTokens = extractQueryKeywords(queryLower);
        Set<String> expandedConcepts = expandConcepts(queryLower, queryTokens);

        List<Book> allBooks = bookRepository.findAll();
        List<ScoredSearchResult> scoredList = new ArrayList<>();

        for (Book b : allBooks) {
            double score = 0.0;
            List<String> matched = new ArrayList<>();

            String title = Objects.toString(b.getTitle(), "").toLowerCase();
            String author = Objects.toString(b.getAuthor(), "").toLowerCase();
            String category = Objects.toString(b.getCategory(), "").toLowerCase();
            String desc = Objects.toString(b.getDescription(), "").toLowerCase();
            String keywords = Objects.toString(b.getKeywords(), "").toLowerCase();

            // Direct token matching with weighted importance
            for (String token : queryTokens) {
                if (title.contains(token)) {
                    score += 4.0;
                    matched.add("Title contains '" + token + "'");
                }
                if (keywords.contains(token)) {
                    score += 3.0;
                    matched.add("Keyword: " + token);
                }
                if (category.contains(token)) {
                    score += 2.5;
                    matched.add("Category: " + b.getCategory());
                }
                if (author.contains(token)) {
                    score += 2.0;
                    matched.add("Author: " + b.getAuthor());
                }
                if (desc.contains(token)) {
                    score += 1.5;
                    matched.add("Description concept");
                }
            }

            // Semantic Concept Expansion matching
            for (String concept : expandedConcepts) {
                if (keywords.contains(concept) || desc.contains(concept) || title.contains(concept)) {
                    score += 2.0;
                    matched.add("Inferred concept: '" + concept + "'");
                }
            }

            // Normalize score against max theoretical score
            if (score > 0.0) {
                int relevancePct = Math.min(99, Math.max(35, (int) Math.round((score / 12.0) * 100)));
                String rationale = buildMatchRationale(b, queryTokens, matched);
                scoredList.add(new ScoredSearchResult(b, score, relevancePct, new ArrayList<>(new LinkedHashSet<>(matched)), rationale));
            }
        }

        scoredList.sort((a, b) -> Double.compare(b.score, a.score));

        List<SemanticSearchResponseDTO> results = scoredList.stream()
                .limit(limit)
                .map(this::toDTO)
                .collect(Collectors.toList());

        long elapsed = System.currentTimeMillis() - startTime;

        // Log for IEEE research evaluation
        logRepository.save(SearchEvaluationLog.builder()
                .query(rawQuery)
                .searchMode("SEMANTIC")
                .executionTimeMs(elapsed)
                .resultsCount(results.size())
                .topMatchedBook(!results.isEmpty() ? results.get(0).getTitle() : "None")
                .build());

        return results;
    }
    @Transactional
    public SearchComparisonDTO compareSearchModes(String query) {
        // 1. Traditional SQL / Keyword search
        long kwStart = System.currentTimeMillis();
        List<Book> kwBooks = (query != null && !query.isBlank()) 
                ? bookRepository.searchBooks(query.trim()) 
                : Collections.emptyList();
        long kwElapsed = System.currentTimeMillis() - kwStart;

        // Log Keyword search
        logRepository.save(SearchEvaluationLog.builder()
                .query(query)
                .searchMode("KEYWORD")
                .executionTimeMs(kwElapsed)
                .resultsCount(kwBooks.size())
                .topMatchedBook(!kwBooks.isEmpty() ? kwBooks.get(0).getTitle() : "None")
                .build());

        List<BookResponseDTO> kwDTOs = kwBooks.stream()
                .map(bookMapper::toResponseDTO)
                .collect(Collectors.toList());

        // 2. Semantic AI Search
        long semStart = System.currentTimeMillis();
        List<SemanticSearchResponseDTO> semResults = searchSemantic(query, 10);
        long semElapsed = System.currentTimeMillis() - semStart;

        String summary;
        if (kwBooks.isEmpty() && !semResults.isEmpty()) {
            summary = "Traditional keyword search returned 0 results because no exact title string matched. " +
                      "Semantic search expanded domain concepts and returned " + semResults.size() + " highly relevant book(s).";
        } else if (semResults.size() > kwBooks.size()) {
            summary = "Semantic search discovered " + (semResults.size() - kwBooks.size()) + " additional conceptually related title(s) " +
                      "beyond strict SQL substring matches.";
        } else {
            summary = "Both search modes identified candidate volumes. Semantic search additionally computed relevance percentage rankings and concept tags.";
        }

        return SearchComparisonDTO.builder()
                .query(query)
                .keywordResults(kwDTOs)
                .keywordLatencyMs(kwElapsed)
                .keywordCount(kwDTOs.size())
                .semanticResults(semResults)
                .semanticLatencyMs(semElapsed)
                .semanticCount(semResults.size())
                .comparisonSummary(summary)
                .build();
    }

    private List<String> extractQueryKeywords(String query) {
        String[] words = query.replaceAll("[^a-z0-9\\s]", " ").split("\\s+");
        List<String> filtered = new ArrayList<>();
        for (String w : words) {
            if (w.length() > 1 && !QUERY_STOP_WORDS.contains(w)) {
                filtered.add(w);
            }
        }
        return filtered;
    }

    private Set<String> expandConcepts(String fullQuery, List<String> tokens) {
        Set<String> expanded = new HashSet<>();
        for (Map.Entry<String, List<String>> entry : CONCEPT_THESAURUS.entrySet()) {
            if (fullQuery.contains(entry.getKey())) {
                expanded.addAll(entry.getValue());
            }
        }
        for (String token : tokens) {
            if (CONCEPT_THESAURUS.containsKey(token)) {
                expanded.addAll(CONCEPT_THESAURUS.get(token));
            }
        }
        return expanded;
    }

    private String buildMatchRationale(Book b, List<String> queryTokens, List<String> matched) {
        return "Matched based on: " + String.join(", ", matched.stream().limit(3).toList());
    }

    private SemanticSearchResponseDTO toDTO(ScoredSearchResult s) {
        Book b = s.book;
        return SemanticSearchResponseDTO.builder()
                .id(b.getId())
                .isbn(b.getIsbn())
                .title(b.getTitle())
                .author(b.getAuthor())
                .category(b.getCategory())
                .availableCopies(b.getAvailableCopies())
                .totalCopies(b.getTotalCopies())
                .description(b.getDescription())
                .relevanceScore(Math.round(s.score * 100.0) / 100.0)
                .relevancePercentage(s.relevancePercentage)
                .matchedKeywords(s.matchedKeywords)
                .searchMode("SEMANTIC")
                .matchRationale(s.matchRationale)
                .aisle(b.getAisle())
                .shelf(b.getShelf())
                .columnRack(b.getColumnRack())
                .build();
    }

    private record ScoredSearchResult(Book book, double score, int relevancePercentage, List<String> matchedKeywords, String matchRationale) {}
}
