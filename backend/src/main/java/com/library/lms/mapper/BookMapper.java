package com.library.lms.mapper;

import com.library.lms.dto.request.BookRequestDTO;
import com.library.lms.dto.response.BookResponseDTO;
import com.library.lms.entity.Book;
import org.springframework.stereotype.Component;

@Component
public class BookMapper {

    public Book toEntity(BookRequestDTO dto) {
        if (dto == null) return null;

        return Book.builder()
                .isbn(dto.getIsbn())
                .title(dto.getTitle())
                .author(dto.getAuthor())
                .category(dto.getCategory())
                .totalCopies(dto.getTotalCopies())
                .availableCopies(dto.getTotalCopies()) // Initially all copies available
                .description(dto.getDescription())
                .keywords(dto.getKeywords())
                .publicationYear(dto.getPublicationYear())
                .averageRating(dto.getAverageRating() != null ? dto.getAverageRating() : 4.5)
                .ratingsCount(10)
                .aisle(dto.getAisle())
                .shelf(dto.getShelf())
                .columnRack(dto.getColumnRack())
                .build();
    }

    public BookResponseDTO toResponseDTO(Book entity) {
        if (entity == null) return null;

        return BookResponseDTO.builder()
                .id(entity.getId())
                .isbn(entity.getIsbn())
                .title(entity.getTitle())
                .author(entity.getAuthor())
                .category(entity.getCategory())
                .totalCopies(entity.getTotalCopies())
                .availableCopies(entity.getAvailableCopies())
                .description(entity.getDescription())
                .keywords(entity.getKeywords())
                .publicationYear(entity.getPublicationYear())
                .averageRating(entity.getAverageRating())
                .ratingsCount(entity.getRatingsCount())
                .aisle(entity.getAisle())
                .shelf(entity.getShelf())
                .columnRack(entity.getColumnRack())
                .createdAt(entity.getCreatedAt())
                .build();
    }

    public void updateEntityFromDTO(BookRequestDTO dto, Book entity) {
        if (dto == null || entity == null) return;

        entity.setIsbn(dto.getIsbn());
        entity.setTitle(dto.getTitle());
        entity.setAuthor(dto.getAuthor());
        entity.setCategory(dto.getCategory());
        
        // Adjust available copies proportionally if total copies changed
        int difference = dto.getTotalCopies() - entity.getTotalCopies();
        entity.setTotalCopies(dto.getTotalCopies());
        entity.setAvailableCopies(Math.max(0, entity.getAvailableCopies() + difference));

        if (dto.getDescription() != null) entity.setDescription(dto.getDescription());
        if (dto.getKeywords() != null) entity.setKeywords(dto.getKeywords());
        if (dto.getPublicationYear() != null) entity.setPublicationYear(dto.getPublicationYear());
        if (dto.getAverageRating() != null) entity.setAverageRating(dto.getAverageRating());
        if (dto.getAisle() != null) entity.setAisle(dto.getAisle());
        if (dto.getShelf() != null) entity.setShelf(dto.getShelf());
        if (dto.getColumnRack() != null) entity.setColumnRack(dto.getColumnRack());
    }
}
