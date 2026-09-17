package com.library.lms.service;

import com.library.lms.dto.response.BookRecommendationDTO;
import com.library.lms.entity.Book;
import com.library.lms.entity.Member;
import com.library.lms.entity.Transaction;
import com.library.lms.exception.ResourceNotFoundException;
import com.library.lms.repository.BookRepository;
import com.library.lms.repository.MemberRepository;
import com.library.lms.repository.TransactionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TfIdfRecommenderService {

    private final BookRepository bookRepository;
    private final MemberRepository memberRepository;
    private final TransactionRepository transactionRepository;

    private static final Set<String> STOP_WORDS = Set.of(
            "a", "about", "above", "after", "again", "against", "all", "am", "an", "and", "any", "are",
            "as", "at", "be", "because", "been", "before", "being", "below", "between", "both", "but",
            "by", "can", "did", "do", "does", "doing", "don", "down", "during", "each", "few", "for",
            "from", "further", "had", "has", "have", "having", "he", "her", "here", "hers", "herself",
            "him", "himself", "his", "how", "i", "if", "in", "into", "is", "it", "its", "itself", "just",
            "me", "more", "most", "my", "myself", "no", "nor", "not", "now", "of", "off", "on", "once",
            "only", "or", "other", "our", "ours", "ourselves", "out", "over", "own", "s", "same", "she",
            "should", "so", "some", "such", "t", "than", "that", "the", "their", "theirs", "them",
            "themselves", "then", "there", "these", "they", "this", "those", "through", "to", "too",
            "under", "until", "up", "very", "was", "we", "were", "what", "when", "where", "which",
            "while", "who", "whom", "why", "will", "with", "you", "your", "yours", "yourself"
    );
    @Transactional(readOnly = true)
    public List<BookRecommendationDTO> getRecommendationsForMember(Long memberId, int limit) {
        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new ResourceNotFoundException("Member not found with id: " + memberId));

        List<Book> allBooks = bookRepository.findAll();
        if (allBooks.isEmpty()) {
            return Collections.emptyList();
        }

        List<Transaction> memberTransactions = transactionRepository.findByMemberId(memberId);
        Set<Long> borrowedBookIds = memberTransactions.stream()
                .map(tx -> tx.getBook().getId())
                .collect(Collectors.toSet());

        // Cold Start scenario: member has no borrowing history
        if (memberTransactions.isEmpty()) {
            return getColdStartRecommendations(allBooks, limit);
        }

        // 1. Identify preferences from history
        Map<String, Integer> categoryCounts = new HashMap<>();
        Map<String, Integer> authorCounts = new HashMap<>();
        List<Book> borrowedBooks = new ArrayList<>();

        for (Transaction tx : memberTransactions) {
            Book b = tx.getBook();
            borrowedBooks.add(b);
            if (b.getCategory() != null) {
                categoryCounts.put(b.getCategory(), categoryCounts.getOrDefault(b.getCategory(), 0) + 1);
            }
            if (b.getAuthor() != null) {
                authorCounts.put(b.getAuthor(), authorCounts.getOrDefault(b.getAuthor(), 0) + 1);
            }
        }

        String topCategory = categoryCounts.entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey)
                .orElse("General");

        String topAuthor = authorCounts.entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey)
                .orElse(null);

        // 2. Build TF-IDF model
        Map<Long, Map<String, Double>> bookTfIdfVectors = computeTfIdfVectors(allBooks);

        // 3. Compute user centroid profile vector
        Map<String, Double> userProfileVector = new HashMap<>();
        for (Book b : borrowedBooks) {
            Map<String, Double> bVec = bookTfIdfVectors.getOrDefault(b.getId(), Collections.emptyMap());
            for (Map.Entry<String, Double> entry : bVec.entrySet()) {
                userProfileVector.put(entry.getKey(), userProfileVector.getOrDefault(entry.getKey(), 0.0) + entry.getValue());
            }
        }
        // Normalize centroid
        if (!borrowedBooks.isEmpty()) {
            for (Map.Entry<String, Double> entry : userProfileVector.entrySet()) {
                userProfileVector.put(entry.getKey(), entry.getValue() / borrowedBooks.size());
            }
        }

        // 4. Rank candidate books (excluding already borrowed)
        List<ScoredBook> scoredBooks = new ArrayList<>();
        for (Book candidate : allBooks) {
            if (borrowedBookIds.contains(candidate.getId())) {
                continue; // Do not recommend books already read
            }

            Map<String, Double> candidateVector = bookTfIdfVectors.getOrDefault(candidate.getId(), Collections.emptyMap());
            double cosineSim = computeCosineSimilarity(userProfileVector, candidateVector);

            // Bonus weights for explainability alignment
            double score = cosineSim * 0.70;
            List<String> matchFactors = new ArrayList<>();

            if (candidate.getCategory() != null && categoryCounts.containsKey(candidate.getCategory())) {
                score += 0.15;
                matchFactors.add("Category Affinity: " + candidate.getCategory() + " (" + categoryCounts.get(candidate.getCategory()) + " previously borrowed)");
            }
            if (candidate.getAuthor() != null && authorCounts.containsKey(candidate.getAuthor())) {
                score += 0.10;
                matchFactors.add("Author Match: " + candidate.getAuthor());
            }
            if (candidate.getAverageRating() != null && candidate.getAverageRating() >= 4.5) {
                score += 0.05;
                matchFactors.add("High Community Rating (" + candidate.getAverageRating() + " / 5.0)");
            }

            if (matchFactors.isEmpty()) {
                matchFactors.add("Topic Semantic Similarity: " + (int) Math.round(cosineSim * 100) + "%");
            }

            // Synthesize explainable justification
            String explanation = buildExplanation(candidate, topCategory, topAuthor, categoryCounts, authorCounts, cosineSim);

            int matchPercent = Math.min(99, Math.max(45, (int) Math.round(score * 100)));
            scoredBooks.add(new ScoredBook(candidate, score, matchPercent, explanation, matchFactors));
        }

        // Sort descending by score
        scoredBooks.sort((a, b) -> Double.compare(b.score, a.score));

        return scoredBooks.stream()
                .limit(limit)
                .map(this::toRecommendationDTO)
                .collect(Collectors.toList());
    }
    @Transactional(readOnly = true)
    public List<BookRecommendationDTO> getSimilarBooks(Long bookId, int limit) {
        Book targetBook = bookRepository.findById(bookId)
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with id: " + bookId));

        List<Book> allBooks = bookRepository.findAll();
        Map<Long, Map<String, Double>> vectors = computeTfIdfVectors(allBooks);
        Map<String, Double> targetVector = vectors.getOrDefault(targetBook.getId(), Collections.emptyMap());

        List<ScoredBook> scored = new ArrayList<>();
        for (Book b : allBooks) {
            if (b.getId().equals(targetBook.getId())) continue;

            Map<String, Double> bVec = vectors.getOrDefault(b.getId(), Collections.emptyMap());
            double sim = computeCosineSimilarity(targetVector, bVec);

            List<String> factors = new ArrayList<>();
            if (Objects.equals(b.getCategory(), targetBook.getCategory())) {
                sim += 0.10;
                factors.add("Same Discipline: " + b.getCategory());
            }
            if (Objects.equals(b.getAuthor(), targetBook.getAuthor())) {
                sim += 0.15;
                factors.add("Same Author: " + b.getAuthor());
            }

            int matchPct = Math.min(99, Math.max(30, (int) Math.round(sim * 100)));
            String explanation = "Recommended because it shares core concepts and classification with '" 
                    + targetBook.getTitle() + "' (Similarity: " + matchPct + "%).";

            scored.add(new ScoredBook(b, sim, matchPct, explanation, factors));
        }

        scored.sort((a, b) -> Double.compare(b.score, a.score));

        return scored.stream()
                .limit(limit)
                .map(this::toRecommendationDTO)
                .collect(Collectors.toList());
    }
    @Transactional(readOnly = true)
    public List<BookRecommendationDTO> getColdStartRecommendations(int limit) {
        return getColdStartRecommendations(bookRepository.findAll(), limit);
    }

    private List<BookRecommendationDTO> getColdStartRecommendations(List<Book> allBooks, int limit) {
        return allBooks.stream()
                .sorted((a, b) -> Double.compare(
                        b.getAverageRating() != null ? b.getAverageRating() : 0.0,
                        a.getAverageRating() != null ? a.getAverageRating() : 0.0
                ))
                .limit(limit)
                .map(b -> BookRecommendationDTO.builder()
                        .id(b.getId())
                        .isbn(b.getIsbn())
                        .title(b.getTitle())
                        .author(b.getAuthor())
                        .category(b.getCategory())
                        .availableCopies(b.getAvailableCopies())
                        .totalCopies(b.getTotalCopies())
                        .averageRating(b.getAverageRating())
                        .similarityScore(0.85)
                        .matchPercentage(85)
                        .explanation("Popular starter recommendation based on high academic rating (" 
                                + (b.getAverageRating() != null ? b.getAverageRating() : 4.5) + " / 5.0) and circulation popularity.")
                        .matchFactors(List.of("Top Academic Rating", "Core Curriculum Foundation"))
                        .aisle(b.getAisle())
                        .shelf(b.getShelf())
                        .columnRack(b.getColumnRack())
                        .build())
                .collect(Collectors.toList());
    }

    private String buildExplanation(Book candidate, String topCategory, String topAuthor, 
                                    Map<String, Integer> catCounts, Map<String, Integer> authCounts, double sim) {
        if (candidate.getAuthor() != null && authCounts.containsKey(candidate.getAuthor())) {
            return "Recommended because you frequently read titles by " + candidate.getAuthor() 
                    + " and topics related to " + candidate.getCategory() + ".";
        }
        if (candidate.getCategory() != null && catCounts.containsKey(candidate.getCategory())) {
            int count = catCounts.get(candidate.getCategory());
            return "Recommended because you previously borrowed " + count + " book" + (count > 1 ? "s" : "") 
                    + " in '" + candidate.getCategory() + "' (Semantic Match: " + (int) Math.round(sim * 100) + "%).";
        }
        return "Recommended based on topic overlap with your reading history in '" + topCategory + "'.";
    }

    private Map<Long, Map<String, Double>> computeTfIdfVectors(List<Book> books) {
        int totalDocs = books.size();
        Map<String, Integer> docFrequency = new HashMap<>();
        Map<Long, List<String>> tokenizedDocs = new HashMap<>();

        for (Book b : books) {
            String fullText = String.join(" ",
                    Objects.toString(b.getTitle(), ""),
                    Objects.toString(b.getCategory(), ""),
                    Objects.toString(b.getAuthor(), ""),
                    Objects.toString(b.getDescription(), ""),
                    Objects.toString(b.getKeywords(), "")
            );
            List<String> tokens = tokenize(fullText);
            tokenizedDocs.put(b.getId(), tokens);

            Set<String> uniqueTokens = new HashSet<>(tokens);
            for (String t : uniqueTokens) {
                docFrequency.put(t, docFrequency.getOrDefault(t, 0) + 1);
            }
        }

        Map<Long, Map<String, Double>> vectors = new HashMap<>();
        for (Book b : books) {
            List<String> tokens = tokenizedDocs.get(b.getId());
            if (tokens.isEmpty()) {
                vectors.put(b.getId(), Collections.emptyMap());
                continue;
            }

            Map<String, Integer> termFreq = new HashMap<>();
            for (String t : tokens) {
                termFreq.put(t, termFreq.getOrDefault(t, 0) + 1);
            }

            Map<String, Double> tfIdf = new HashMap<>();
            for (Map.Entry<String, Integer> entry : termFreq.entrySet()) {
                String term = entry.getKey();
                double tf = (double) entry.getValue() / tokens.size();
                int df = docFrequency.getOrDefault(term, 1);
                double idf = Math.log(1.0 + ((double) totalDocs / df));
                tfIdf.put(term, tf * idf);
            }
            vectors.put(b.getId(), tfIdf);
        }

        return vectors;
    }

    private double computeCosineSimilarity(Map<String, Double> vecA, Map<String, Double> vecB) {
        if (vecA == null || vecB == null || vecA.isEmpty() || vecB.isEmpty()) {
            return 0.0;
        }

        double dotProduct = 0.0;
        double normA = 0.0;
        double normB = 0.0;

        for (Double val : vecA.values()) {
            normA += val * val;
        }
        for (Double val : vecB.values()) {
            normB += val * val;
        }

        for (Map.Entry<String, Double> entry : vecA.entrySet()) {
            if (vecB.containsKey(entry.getKey())) {
                dotProduct += entry.getValue() * vecB.get(entry.getKey());
            }
        }

        if (normA == 0.0 || normB == 0.0) return 0.0;
        return dotProduct / (Math.sqrt(normA) * Math.sqrt(normB));
    }

    private List<String> tokenize(String text) {
        if (text == null || text.isBlank()) return Collections.emptyList();
        String[] raw = text.toLowerCase().replaceAll("[^a-z0-9\\s]", " ").split("\\s+");
        List<String> clean = new ArrayList<>();
        for (String w : raw) {
            if (w.length() > 2 && !STOP_WORDS.contains(w)) {
                clean.add(w);
            }
        }
        return clean;
    }

    private BookRecommendationDTO toRecommendationDTO(ScoredBook sb) {
        Book b = sb.book;
        return BookRecommendationDTO.builder()
                .id(b.getId())
                .isbn(b.getIsbn())
                .title(b.getTitle())
                .author(b.getAuthor())
                .category(b.getCategory())
                .availableCopies(b.getAvailableCopies())
                .totalCopies(b.getTotalCopies())
                .averageRating(b.getAverageRating())
                .similarityScore(Math.round(sb.score * 1000.0) / 1000.0)
                .matchPercentage(sb.matchPercentage)
                .explanation(sb.explanation)
                .matchFactors(sb.matchFactors)
                .aisle(b.getAisle())
                .shelf(b.getShelf())
                .columnRack(b.getColumnRack())
                .build();
    }

    private record ScoredBook(Book book, double score, int matchPercentage, String explanation, List<String> matchFactors) {}
}
