package com.library.lms.dto.response;

import com.library.lms.entity.FineStatus;
import com.library.lms.entity.PaymentMethod;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FineResponseDTO {

    private Long id;
    private Long transactionId;
    private String bookTitle;
    private String bookIsbn;
    private Long memberId;
    private String memberName;
    private String memberEmail;
    private BigDecimal amount;
    private String reason;
    private FineStatus status;
    private LocalDate paymentDate;
    private PaymentMethod paymentMethod;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
