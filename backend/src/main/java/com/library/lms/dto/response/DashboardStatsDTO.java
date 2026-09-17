package com.library.lms.dto.response;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DashboardStatsDTO {

    private long totalBooks;
    private long totalAvailableBooks;
    private long totalMembers;
    private long activeMembers;
    private long currentlyIssuedBooks;
    private long overdueTransactions;
    private BigDecimal totalFinesAccrued;
    private BigDecimal totalUnpaidFines;
    private BigDecimal totalPaidFines;
}
