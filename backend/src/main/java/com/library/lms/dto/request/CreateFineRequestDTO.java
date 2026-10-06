package com.library.lms.dto.request;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateFineRequestDTO {

    @NotNull(message = "Member ID is required")
    private Long memberId;

    @NotNull(message = "Fine amount is required")
    @DecimalMin(value = "1.00", message = "Fine amount must be at least ₹1.00")
    private BigDecimal amount;

    @NotBlank(message = "Reason / Violation description is required")
    private String reason;

    private Long transactionId;
}
