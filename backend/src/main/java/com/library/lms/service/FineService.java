package com.library.lms.service;

import com.library.lms.dto.request.PayFineRequestDTO;
import com.library.lms.dto.response.FineResponseDTO;
import com.library.lms.entity.Fine;
import com.library.lms.entity.FineStatus;
import com.library.lms.exception.BusinessException;
import com.library.lms.exception.ResourceNotFoundException;
import com.library.lms.mapper.FineMapper;
import com.library.lms.repository.FineRepository;
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
    private final FineMapper fineMapper;
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
        return fineMapper.toResponseDTO(updatedFine);
    }
}
