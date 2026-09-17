package com.library.lms.mapper;

import com.library.lms.dto.response.FineResponseDTO;
import com.library.lms.entity.Fine;
import org.springframework.stereotype.Component;

@Component
public class FineMapper {

    public FineResponseDTO toResponseDTO(Fine fine) {
        if (fine == null) return null;

        return FineResponseDTO.builder()
                .id(fine.getId())
                .transactionId(fine.getTransaction() != null ? fine.getTransaction().getId() : null)
                .bookTitle(fine.getTransaction() != null && fine.getTransaction().getBook() != null
                        ? fine.getTransaction().getBook().getTitle() : null)
                .bookIsbn(fine.getTransaction() != null && fine.getTransaction().getBook() != null
                        ? fine.getTransaction().getBook().getIsbn() : null)
                .memberId(fine.getMember() != null ? fine.getMember().getId() : null)
                .memberName(fine.getMember() != null ? fine.getMember().getName() : null)
                .memberEmail(fine.getMember() != null ? fine.getMember().getEmail() : null)
                .amount(fine.getAmount())
                .status(fine.getStatus())
                .paymentDate(fine.getPaymentDate())
                .paymentMethod(fine.getPaymentMethod())
                .createdAt(fine.getCreatedAt())
                .updatedAt(fine.getUpdatedAt())
                .build();
    }
}
