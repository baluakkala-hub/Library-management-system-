package com.library.lms.controller;

import com.library.lms.dto.request.IssueRequestDTO;
import com.library.lms.dto.response.ApiResponse;
import com.library.lms.dto.response.TransactionResponseDTO;
import com.library.lms.service.TransactionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@RestController
@RequestMapping("/api/transactions")
@RequiredArgsConstructor
@Tag(name = "Lending & Transactions API", description = "Endpoints for book issue, return workflows, and history")
public class TransactionController {

    private final TransactionService transactionService;

    @GetMapping
    @Operation(summary = "Get all transactions")
    public ResponseEntity<ApiResponse<List<TransactionResponseDTO>>> getAllTransactions() {
        return ResponseEntity.ok(ApiResponse.ok(transactionService.getAllTransactions()));
    }

    @GetMapping("/active")
    @Operation(summary = "Get all currently active/issued book loans")
    public ResponseEntity<ApiResponse<List<TransactionResponseDTO>>> getActiveTransactions() {
        return ResponseEntity.ok(ApiResponse.ok(transactionService.getActiveTransactions()));
    }

    @GetMapping("/overdue")
    @Operation(summary = "Get all overdue book loans")
    public ResponseEntity<ApiResponse<List<TransactionResponseDTO>>> getOverdueTransactions() {
        return ResponseEntity.ok(ApiResponse.ok(transactionService.getOverdueTransactions()));
    }

    @GetMapping("/member/{memberId}")
    @Operation(summary = "Get all transactions for a specific member")
    public ResponseEntity<ApiResponse<List<TransactionResponseDTO>>> getMemberTransactions(@PathVariable Long memberId) {
        return ResponseEntity.ok(ApiResponse.ok(transactionService.getTransactionsByMember(memberId)));
    }

    @PostMapping("/issue")
    @Operation(summary = "Issue a book to an active member")
    public ResponseEntity<ApiResponse<TransactionResponseDTO>> issueBook(
            @Valid @RequestBody IssueRequestDTO request) {
        TransactionResponseDTO response = transactionService.issueBook(request);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.ok(response, "Book issued successfully"));
    }

    @PostMapping("/{id}/return")
    @Operation(summary = "Process return of an issued book and calculate fines")
    public ResponseEntity<ApiResponse<TransactionResponseDTO>> returnBook(
            @PathVariable Long id) {
        TransactionResponseDTO response = transactionService.returnBook(id);
        return ResponseEntity.ok(ApiResponse.ok(response, "Book returned successfully"));
    }

    @GetMapping("/export/csv")
    @Operation(summary = "Export all active loans to CSV report")
    public void exportActiveLoansCsv(HttpServletResponse response) throws IOException {
        response.setContentType("text/csv");
        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"active_loans_report.csv\"");

        List<TransactionResponseDTO> activeLoans = transactionService.getActiveTransactions();
        PrintWriter writer = response.getWriter();
        writer.println("Transaction ID,Book Title,ISBN,Borrower Name,Borrower Email,Issue Date,Due Date,Status");

        for (TransactionResponseDTO loan : activeLoans) {
            writer.printf("\"#%d\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\"%n",
                    loan.getId(),
                    loan.getBookTitle() != null ? loan.getBookTitle().replace("\"", "\"\"") : "",
                    loan.getBookIsbn() != null ? loan.getBookIsbn() : "",
                    loan.getMemberName() != null ? loan.getMemberName().replace("\"", "\"\"") : "",
                    loan.getMemberEmail() != null ? loan.getMemberEmail() : "",
                    loan.getIssueDate(),
                    loan.getDueDate(),
                    loan.getStatus()
            );
        }
        writer.flush();
    }
}
