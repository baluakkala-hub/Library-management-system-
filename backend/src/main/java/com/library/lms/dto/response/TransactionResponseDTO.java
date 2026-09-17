package com.library.lms.dto.response;

import com.library.lms.entity.TransactionStatus;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TransactionResponseDTO {

    private Long id;
    
    // Book details
    private Long bookId;
    private String bookTitle;
    private String bookIsbn;

    // Member details
    private Long memberId;
    private String memberName;
    private String memberEmail;

    // Dates
    private LocalDate issueDate;
    private LocalDate dueDate;
    private LocalDate returnDate;
    private TransactionStatus status;
    private BigDecimal fineAmount;
    private LocalDateTime createdAt;
}
