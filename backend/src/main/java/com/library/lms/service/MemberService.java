package com.library.lms.service;

import com.library.lms.dto.request.MemberRequestDTO;
import com.library.lms.dto.response.MemberResponseDTO;
import com.library.lms.entity.Member;
import com.library.lms.entity.TransactionStatus;
import com.library.lms.exception.BusinessException;
import com.library.lms.exception.ResourceNotFoundException;
import com.library.lms.mapper.MemberMapper;
import com.library.lms.repository.MemberRepository;
import com.library.lms.repository.TransactionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository memberRepository;
    private final TransactionRepository transactionRepository;
    private final MemberMapper memberMapper;
    @Transactional(readOnly = true)
    public List<MemberResponseDTO> getAllMembers() {
        return memberRepository.findAll().stream()
                .map(memberMapper::toResponseDTO)
                .collect(Collectors.toList());
    }
    @Transactional(readOnly = true)
    public MemberResponseDTO getMemberById(Long id) {
        Member member = memberRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Member not found with id: " + id));
        return memberMapper.toResponseDTO(member);
    }
    @Transactional(readOnly = true)
    public List<MemberResponseDTO> searchMembers(String query) {
        if (query == null || query.trim().isEmpty()) {
            return getAllMembers();
        }
        return memberRepository.searchMembers(query.trim()).stream()
                .map(memberMapper::toResponseDTO)
                .collect(Collectors.toList());
    }
    @Transactional
    public MemberResponseDTO createMember(MemberRequestDTO request) {
        if (memberRepository.existsByEmail(request.getEmail())) {
            throw new BusinessException("A member with email " + request.getEmail() + " already exists");
        }
        Member member = memberMapper.toEntity(request);
        Member savedMember = memberRepository.save(member);
        return memberMapper.toResponseDTO(savedMember);
    }
    @Transactional
    public MemberResponseDTO updateMember(Long id, MemberRequestDTO request) {
        Member member = memberRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Member not found with id: " + id));

        if (!member.getEmail().equals(request.getEmail()) && memberRepository.existsByEmail(request.getEmail())) {
            throw new BusinessException("A member with email " + request.getEmail() + " already exists");
        }

        memberMapper.updateEntityFromDTO(request, member);
        Member updatedMember = memberRepository.save(member);
        return memberMapper.toResponseDTO(updatedMember);
    }
    @Transactional
    public void deleteMember(Long id) {
        Member member = memberRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Member not found with id: " + id));

        long activeLoans = transactionRepository.countByMemberIdAndStatus(id, TransactionStatus.ISSUED);
        if (activeLoans > 0) {
            throw new BusinessException("Cannot delete member: member currently has " + activeLoans + " unreturned books");
        }

        memberRepository.delete(member);
    }
}
