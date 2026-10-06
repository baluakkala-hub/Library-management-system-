package com.library.lms.dto.request;

import com.library.lms.entity.PaymentMethod;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PayFineRequestDTO {

    @NotNull(message = "Payment method is required")
    private PaymentMethod paymentMethod;
}
