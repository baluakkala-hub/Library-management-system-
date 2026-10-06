package com.library.lms.service;

import com.library.lms.dto.response.SimulationResponseDTO;
import com.library.lms.entity.MemberStatus;
import com.library.lms.repository.BookRepository;
import com.library.lms.repository.FineRepository;
import com.library.lms.repository.MemberRepository;
import com.library.lms.repository.TransactionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class SimulationService {

    private final JdbcTemplate jdbcTemplate;
    private final BookRepository bookRepository;
    private final MemberRepository memberRepository;
    private final TransactionRepository transactionRepository;
    private final FineRepository fineRepository;

    private static final List<String> PERSONALISED_PROFILES = Arrays.asList(
            "Satish Kumar (CS) -> Clean Code & Operating Systems",
            "Bala Krishna (AI) -> Deep Learning, Transformers & Hands-On ML",
            "Divya Reddy (ECE) -> Microelectronics & CMOS VLSI",
            "Soumya Naidu (Civil) -> Structural Analysis & Concrete Structures",
            "Lokesh Reddy (Mech) -> Thermodynamics & Robotics Mechanics",
            "Ananya Sharma (CS) -> Compilers & Cloud Native Patterns",
            "Jahnvi Rao (Data) -> Deep Learning & Data-Intensive Applications",
            "Sravya Murthy (MBA) -> Financial Management & The Lean Startup",
            "Spoorthi Varma (IT) -> Algorithms (CLRS) & Discrete Mathematics",
            "Aarav Patel (Mech) -> Aerodynamics & Finite Element Analysis",
            "Rohan Mukherjee (CS) -> NLP with Transformers & Reinforcement Learning",
            "Priya Nambiar (ECE) -> Signals & Systems & Wireless Communications",
            "Vikramaditya Singh (Civil) -> Bridge Engineering & Earthquake Engineering",
            "Sneha Kulkarni (Data) -> Pattern Recognition & Sapiens",
            "Tanvi Deshmukh (Mech) -> Mechatronics & Modern Control Engineering",
            "Meera Iyer (Literature) -> Dune, Dune Messiah & Foundation",
            "Aditya Varma (Literature) -> The Guide & Midnight's Children",
            "Siddharth Nair (MBA) -> Supply Chain Strategy & Project Management",
            "Ishaan Chatterjee (CS) -> Quantum Computing & Cyberpunk (Neuromancer)",
            "Ritika Barua (Sci-Fi) -> The Martian & Project Hail Mary",
            "Jagan Chowdhary (EEE) -> Electric Circuits & Power Electronics",
            "Harpreet Kaur (EEE) -> Communication Systems & Antenna Theory",
            "Riya Sengupta (Data) -> Deep Learning & Data-Intensive Applications",
            "Arjun Pillai (EEE) -> Embedded System Design & Digital Signal Processing",
            "Kavya Sundaram (Civil) -> Surveying and Levelling & Transportation Planning",
            "Devendra Rathore (Mech) -> Internal Combustion Engines & Manufacturing Technology",
            "Pooja Hegde (IT) -> Computer Networks & Database System Concepts",
            "Nikhil Joshi (CS) -> Computer Systems & Design Patterns",
            "Neha Bhattacharya (AI) -> Artificial Intelligence (AIMA) & Reinforcement Learning",
            "Chirag Mehta (MBA) -> Essentials of Management & Marketing Management"
    );

    @Transactional(readOnly = true)
    public SimulationResponseDTO getSimulationStatus() {
        long totalBooks = bookRepository.count();
        long activeBorrowers = memberRepository.countByStatus(MemberStatus.ACTIVE);
        long deactivatedMembers = memberRepository.countByStatus(MemberStatus.INACTIVE);
        long totalLoans = transactionRepository.count();
        long totalFines = fineRepository.count();
        BigDecimal unpaidFines = fineRepository.sumTotalUnpaidFines();

        return SimulationResponseDTO.builder()
                .totalBooks(totalBooks)
                .activeBorrowersCount(activeBorrowers)
                .deactivatedStudentsCount(deactivatedMembers)
                .totalLoansCount(totalLoans)
                .totalFinesCount(totalFines)
                .totalUnpaidFinesAmount(unpaidFines != null ? unpaidFines : BigDecimal.ZERO)
                .statusMessage(String.format("Catalog: %d books (including Dune). Active Borrowers: %d. Deactivated IDs: %d.",
                        totalBooks, activeBorrowers, deactivatedMembers))
                .simulatedStudentProfiles(PERSONALISED_PROFILES)
                .build();
    }

    @Transactional
    public SimulationResponseDTO runSimulation() {
        log.info("Starting automated student borrowing simulation...");

        // Ensure available copies match total copies before simulation adjustments
        jdbcTemplate.update("""
            UPDATE books b SET b.available_copies = b.total_copies - (
                SELECT COUNT(*) FROM transactions t WHERE t.book_id = b.id AND t.status IN ('ISSUED', 'OVERDUE')
            )
        """);

        // Deactivate members with 0 transactions and disable their user login
        jdbcTemplate.update("""
            UPDATE members m
            SET m.status = 'INACTIVE'
            WHERE (SELECT COUNT(*) FROM transactions t WHERE t.member_id = m.id) = 0
        """);

        jdbcTemplate.update("""
            UPDATE users u
            JOIN members m ON u.member_id = m.id
            SET u.enabled = 0
            WHERE m.status = 'INACTIVE'
        """);

        // Reactivate members with > 0 transactions and enable user login
        jdbcTemplate.update("""
            UPDATE members m
            SET m.status = 'ACTIVE'
            WHERE (SELECT COUNT(*) FROM transactions t WHERE t.member_id = m.id) > 0
        """);

        jdbcTemplate.update("""
            UPDATE users u
            JOIN members m ON u.member_id = m.id
            SET u.enabled = 1
            WHERE m.status = 'ACTIVE'
        """);

        log.info("Simulation completed successfully.");
        return getSimulationStatus();
    }
}
