package com.library.lms.mapper;

import com.library.lms.dto.request.MemberRequestDTO;
import com.library.lms.dto.response.MemberResponseDTO;
import com.library.lms.entity.Member;
import com.library.lms.entity.MemberStatus;
import org.springframework.stereotype.Component;

import java.time.LocalDate;

@Component
public class MemberMapper {

    public Member toEntity(MemberRequestDTO dto) {
        if (dto == null) return null;
        return Member.builder()
                .name(dto.getName())
                .email(dto.getEmail())
                .phone(dto.getPhone())
                .status(dto.getStatus() != null ? dto.getStatus() : MemberStatus.ACTIVE)
                .membershipDate(LocalDate.now())
                .build();
    }

    public MemberResponseDTO toResponseDTO(Member entity) {
        if (entity == null) return null;
        return MemberResponseDTO.builder()
                .id(entity.getId())
                .name(entity.getName())
                .email(entity.getEmail())
                .phone(entity.getPhone())
                .status(entity.getStatus())
                .membershipDate(entity.getMembershipDate())
                .createdAt(entity.getCreatedAt())
                .updatedAt(entity.getUpdatedAt())
                .build();
    }

    public void updateEntityFromDTO(MemberRequestDTO dto, Member entity) {
        if (dto == null || entity == null) return;
        entity.setName(dto.getName());
        entity.setEmail(dto.getEmail());
        entity.setPhone(dto.getPhone());
        if (dto.getStatus() != null) {
            entity.setStatus(dto.getStatus());
        }
    }
}
