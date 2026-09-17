package com.library.lms.mapper;

import com.library.lms.dto.response.TransactionResponseDTO;
import com.library.lms.entity.Transaction;
import org.springframework.stereotype.Component;

@Component
public class TransactionMapper {

    public TransactionResponseDTO toResponseDTO(Transaction entity) {
        if (entity == null) return null;
        return TransactionResponseDTO.builder()
                .id(entity.getId())
                .bookId(entity.getBook() != null ? entity.getBook().getId() : null)
                .bookTitle(entity.getBook() != null ? entity.getBook().getTitle() : null)
                .bookIsbn(entity.getBook() != null ? entity.getBook().getIsbn() : null)
                .memberId(entity.getMember() != null ? entity.getMember().getId() : null)
                .memberName(entity.getMember() != null ? entity.getMember().getName() : null)
                .memberEmail(entity.getMember() != null ? entity.getMember().getEmail() : null)
                .issueDate(entity.getIssueDate())
                .dueDate(entity.getDueDate())
                .returnDate(entity.getReturnDate())
                .status(entity.getStatus())
                .fineAmount(entity.getFineAmount())
                .createdAt(entity.getCreatedAt())
                .build();
    }
}
