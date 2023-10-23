package com.bookdone.member.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

import com.bookdone.member.entity.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {
    Optional<Member> findByOauthId(String oauthId);
}
