package com.library.lms.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SimulationResponseDTO {
    private long totalBooks;
    private long activeBorrowersCount;
    private long deactivatedStudentsCount;
    private long totalLoansCount;
    private long totalFinesCount;
    private BigDecimal totalUnpaidFinesAmount;
    private String statusMessage;
    private List<String> simulatedStudentProfiles;
}
