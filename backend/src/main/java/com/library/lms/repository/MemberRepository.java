package com.library.lms.repository;

import com.library.lms.entity.Member;
import com.library.lms.entity.MemberStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {

    Optional<Member> findByEmail(String email);

    boolean existsByEmail(String email);

    @Query("SELECT m FROM Member m WHERE LOWER(m.name) LIKE LOWER(CONCAT('%', :query, '%')) " +
           "OR LOWER(m.email) LIKE LOWER(CONCAT('%', :query, '%')) " +
           "OR m.phone LIKE CONCAT('%', :query, '%')")
    List<Member> searchMembers(@Param("query") String query);

    long countByStatus(MemberStatus status);
}
