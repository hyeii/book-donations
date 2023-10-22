package com.bookdone.user.service;

import com.bookdone.user.dto.request.JoinMemberRequest;
import com.bookdone.user.dto.response.MemberResponse;
import com.bookdone.user.entity.Member;
import java.util.Optional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import com.bookdone.user.repository.MemberRepository;

import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberService {

	private final MemberRepository memberRepository;

	public MemberResponse findByOauthId(String oauthId) {
		Member member = memberRepository.findByOauthId(oauthId)
				.orElseThrow(() -> new IllegalArgumentException("존재하지 않는 아이디입니다."));
		return MemberResponse.toResponse(member);
	}

	@Transactional
	public MemberResponse join(JoinMemberRequest joinMemberRequest) {
		Member member = joinMemberRequest.toEntity();
		memberRepository.save(member);
		log.info("member join - {}", member);
		return MemberResponse.toResponse(member);
	}

}
