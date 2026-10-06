package com.library.lms.service;

import com.library.lms.dto.request.CreateFineRequestDTO;
import com.library.lms.dto.request.PayFineRequestDTO;
import com.library.lms.dto.response.FineResponseDTO;
import com.library.lms.entity.Fine;
import com.library.lms.entity.FineStatus;
import com.library.lms.entity.Member;
import com.library.lms.entity.Transaction;
import com.library.lms.exception.BusinessException;
import com.library.lms.exception.ResourceNotFoundException;
import com.library.lms.mapper.FineMapper;
import com.library.lms.repository.FineRepository;
import com.library.lms.repository.MemberRepository;
import com.library.lms.repository.TransactionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class FineService {

    private final FineRepository fineRepository;
    private final MemberRepository memberRepository;
    private final TransactionRepository transactionRepository;
    private final FineMapper fineMapper;
    private final EmailNotificationService emailNotificationService;

    @Transactional(readOnly = true)
    public List<FineResponseDTO> getAllFines() {
        return fineRepository.findAll().stream()
                .map(fineMapper::toResponseDTO)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<FineResponseDTO> getUnpaidFines() {
        return fineRepository.findByStatus(FineStatus.UNPAID).stream()
                .map(fineMapper::toResponseDTO)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<FineResponseDTO> getFinesByMember(Long memberId) {
        return fineRepository.findByMemberId(memberId).stream()
                .map(fineMapper::toResponseDTO)
                .collect(Collectors.toList());
    }

    @Transactional
    public FineResponseDTO createFine(CreateFineRequestDTO request) {
        Member member = memberRepository.findById(request.getMemberId())
                .orElseThrow(() -> new ResourceNotFoundException("Member not found with id: " + request.getMemberId()));

        Transaction transaction = null;
        if (request.getTransactionId() != null) {
            transaction = transactionRepository.findById(request.getTransactionId()).orElse(null);
        }

        Fine fine = Fine.builder()
                .member(member)
                .transaction(transaction)
                .amount(request.getAmount())
                .reason(request.getReason())
                .status(FineStatus.UNPAID)
                .build();

        Fine savedFine = fineRepository.save(fine);

        // Send automated notification email to student
        if (member.getEmail() != null && !member.getEmail().isBlank()) {
            emailNotificationService.sendFineAssessedEmail(
                    member.getEmail(),
                    member.getName(),
                    savedFine.getAmount(),
                    savedFine.getReason() != null ? savedFine.getReason() : "Library Policy Violation"
            );
        }

        return fineMapper.toResponseDTO(savedFine);
    }

    @Transactional
    public FineResponseDTO payFine(Long fineId, PayFineRequestDTO request) {
        Fine fine = fineRepository.findById(fineId)
                .orElseThrow(() -> new ResourceNotFoundException("Fine record not found with id: " + fineId));

        if (fine.getStatus() == FineStatus.PAID) {
            throw new BusinessException("This fine has already been settled and marked as PAID.");
        }

        fine.setStatus(FineStatus.PAID);
        fine.setPaymentDate(LocalDate.now());
        fine.setPaymentMethod(request.getPaymentMethod());

        Fine updatedFine = fineRepository.save(fine);

        // Send confirmation receipt email
        if (fine.getMember() != null && fine.getMember().getEmail() != null) {
            emailNotificationService.sendFineSettledEmail(
                    fine.getMember().getEmail(),
                    fine.getMember().getName(),
                    fine.getAmount(),
                    request.getPaymentMethod() != null ? request.getPaymentMethod().name() : "ONLINE"
            );
        }

        return fineMapper.toResponseDTO(updatedFine);
    }
}
