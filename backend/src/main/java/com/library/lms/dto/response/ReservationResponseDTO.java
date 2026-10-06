package com.library.lms.dto.response;

import com.library.lms.entity.ReservationStatus;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReservationResponseDTO {

    private Long id;
    private Long bookId;
    private String bookTitle;
    private String bookIsbn;
    private Long memberId;
    private String memberName;
    private String memberEmail;
    private LocalDate reservationDate;
    private ReservationStatus status;
    private LocalDate fulfillmentDate;
    private LocalDateTime createdAt;
}
