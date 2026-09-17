package com.library.lms.repository;

import com.library.lms.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {

    Optional<Book> findByIsbn(String isbn);

    boolean existsByIsbn(String isbn);

    @Query("SELECT b FROM Book b WHERE LOWER(b.title) LIKE LOWER(CONCAT('%', :query, '%')) " +
           "OR LOWER(b.author) LIKE LOWER(CONCAT('%', :query, '%')) " +
           "OR LOWER(b.category) LIKE LOWER(CONCAT('%', :query, '%')) " +
           "OR b.isbn LIKE CONCAT('%', :query, '%')")
    List<Book> searchBooks(@Param("query") String query);

    @Query("SELECT COALESCE(SUM(b.totalCopies), 0) FROM Book b")
    long sumTotalCopies();

    @Query("SELECT COALESCE(SUM(b.availableCopies), 0) FROM Book b")
    long sumAvailableCopies();
}
