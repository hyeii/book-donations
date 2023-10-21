package com.bookdone.user.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

import com.bookdone.user.entity.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {
    Optional<Member> findByOauthId(String oauthId);
}
