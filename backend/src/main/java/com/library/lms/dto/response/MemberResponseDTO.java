package com.library.lms.dto.response;

import com.library.lms.entity.MemberStatus;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberResponseDTO {

    private Long id;
    private String name;
    private String email;
    private String phone;
    private MemberStatus status;
    private LocalDate membershipDate;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
