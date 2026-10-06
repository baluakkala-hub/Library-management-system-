package com.library.lms.controller;

import com.library.lms.dto.request.LoginRequestDTO;
import com.library.lms.dto.response.ApiResponse;
import com.library.lms.dto.response.AuthResponseDTO;
import com.library.lms.entity.User;
import com.library.lms.exception.BusinessException;
import com.library.lms.repository.UserRepository;
import com.library.lms.security.JwtUtils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
@Tag(name = "Authentication API", description = "Endpoints for user login, credentials verification, and JWT session handling")
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final UserRepository userRepository;
    private final JwtUtils jwtUtils;

    @PostMapping("/login")
    @Operation(summary = "Authenticate user with username or email and password")
    public ResponseEntity<ApiResponse<AuthResponseDTO>> login(@Valid @RequestBody LoginRequestDTO request) {
        try {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(request.getUsernameOrEmail(), request.getPassword())
            );

            SecurityContextHolder.getContext().setAuthentication(authentication);

            User user = userRepository.findByUsernameOrEmail(request.getUsernameOrEmail(), request.getUsernameOrEmail())
                    .orElseThrow(() -> new BusinessException("User profile not found"));

            String token = jwtUtils.generateToken(
                    user.getUsername(),
                    user.getRole().name(),
                    user.getEmail(),
                    user.getMemberId()
            );

            AuthResponseDTO responseDTO = AuthResponseDTO.builder()
                    .token(token)
                    .type("Bearer")
                    .id(user.getId())
                    .username(user.getUsername())
                    .email(user.getEmail())
                    .role(user.getRole().name())
                    .name(user.getName())
                    .avatar(user.getAvatar())
                    .department(user.getDepartment())
                    .memberId(user.getMemberId())
                    .build();

            return ResponseEntity.ok(ApiResponse.ok(responseDTO, "Login successful"));
        } catch (BadCredentialsException e) {
            log.warn("Authentication failed for '{}': Invalid credentials", request.getUsernameOrEmail());
            throw new BusinessException("Invalid username/email or password");
        }
    }

    @GetMapping("/me")
    @Operation(summary = "Get current authenticated user profile")
    public ResponseEntity<ApiResponse<AuthResponseDTO>> getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || "anonymousUser".equals(auth.getName())) {
            throw new BusinessException("User is not authenticated");
        }

        User user = userRepository.findByUsername(auth.getName())
                .orElseThrow(() -> new BusinessException("User profile not found"));

        AuthResponseDTO responseDTO = AuthResponseDTO.builder()
                .id(user.getId())
                .username(user.getUsername())
                .email(user.getEmail())
                .role(user.getRole().name())
                .name(user.getName())
                .avatar(user.getAvatar())
                .department(user.getDepartment())
                .memberId(user.getMemberId())
                .build();

        return ResponseEntity.ok(ApiResponse.ok(responseDTO));
    }
}
