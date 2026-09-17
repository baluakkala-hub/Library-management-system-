package com.library.lms.mapper;

import com.library.lms.dto.response.ReservationResponseDTO;
import com.library.lms.entity.Reservation;
import org.springframework.stereotype.Component;

@Component
public class ReservationMapper {

    public ReservationResponseDTO toResponseDTO(Reservation entity) {
        if (entity == null) return null;

        return ReservationResponseDTO.builder()
                .id(entity.getId())
                .bookId(entity.getBook() != null ? entity.getBook().getId() : null)
                .bookTitle(entity.getBook() != null ? entity.getBook().getTitle() : null)
                .bookIsbn(entity.getBook() != null ? entity.getBook().getIsbn() : null)
                .memberId(entity.getMember() != null ? entity.getMember().getId() : null)
                .memberName(entity.getMember() != null ? entity.getMember().getName() : null)
                .memberEmail(entity.getMember() != null ? entity.getMember().getEmail() : null)
                .reservationDate(entity.getReservationDate())
                .status(entity.getStatus())
                .fulfillmentDate(entity.getFulfillmentDate())
                .createdAt(entity.getCreatedAt())
                .build();
    }
}
