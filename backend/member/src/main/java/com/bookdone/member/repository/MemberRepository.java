package com.bookdone.member.repository;

import com.bookdone.member.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {
    Optional<Member> findByOauthId(String oauthId);

    Optional<Member> findById(Long id);

    List<Member> findByIdIn(List<Long> ids);
}
