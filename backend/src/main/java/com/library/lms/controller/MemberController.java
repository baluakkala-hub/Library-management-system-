package com.library.lms.controller;

import com.library.lms.dto.request.MemberRequestDTO;
import com.library.lms.dto.response.ApiResponse;
import com.library.lms.dto.response.MemberResponseDTO;
import com.library.lms.service.MemberService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/members")
@RequiredArgsConstructor
@Tag(name = "Members API", description = "Endpoints for managing library members")
public class MemberController {

    private final MemberService memberService;

    @GetMapping
    @Operation(summary = "Get all members or filter by search query")
    public ResponseEntity<ApiResponse<List<MemberResponseDTO>>> getMembers(
            @RequestParam(required = false) String search) {
        List<MemberResponseDTO> members = (search != null && !search.isBlank())
                ? memberService.searchMembers(search)
                : memberService.getAllMembers();
        return ResponseEntity.ok(ApiResponse.ok(members));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get a member by ID")
    public ResponseEntity<ApiResponse<MemberResponseDTO>> getMemberById(@PathVariable Long id) {
        return ResponseEntity.ok(ApiResponse.ok(memberService.getMemberById(id)));
    }

    @PostMapping
    @Operation(summary = "Register a new library member")
    public ResponseEntity<ApiResponse<MemberResponseDTO>> createMember(
            @Valid @RequestBody MemberRequestDTO request) {
        MemberResponseDTO createdMember = memberService.createMember(request);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.ok(createdMember, "Member registered successfully"));
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update member details")
    public ResponseEntity<ApiResponse<MemberResponseDTO>> updateMember(
            @PathVariable Long id,
            @Valid @RequestBody MemberRequestDTO request) {
        MemberResponseDTO updatedMember = memberService.updateMember(id, request);
        return ResponseEntity.ok(ApiResponse.ok(updatedMember, "Member updated successfully"));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete a member by ID")
    public ResponseEntity<ApiResponse<Void>> deleteMember(@PathVariable Long id) {
        memberService.deleteMember(id);
        return ResponseEntity.ok(ApiResponse.ok(null, "Member deleted successfully"));
    }

    @PatchMapping("/{id}/toggle-status")
    @Operation(summary = "Toggle member active/inactive status and matching user login access")
    public ResponseEntity<ApiResponse<MemberResponseDTO>> toggleMemberStatus(@PathVariable Long id) {
        MemberResponseDTO updated = memberService.toggleMemberStatus(id);
        String msg = "Member ID " + (updated.getStatus().equals("ACTIVE") ? "reactivated successfully" : "deactivated");
        return ResponseEntity.ok(ApiResponse.ok(updated, msg));
    }
}
