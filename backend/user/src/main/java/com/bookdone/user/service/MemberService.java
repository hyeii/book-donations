package com.bookdone.user.service;

import com.bookdone.user.dto.response.MemberResponse;
import com.bookdone.user.entity.Member;
import java.util.Optional;
import org.springframework.stereotype.Service;

import com.bookdone.user.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {

	private final MemberRepository memberRepository;

	public MemberResponse findByOauthId(String oauthId) {
		Member member = memberRepository.findByOauthId(oauthId)
				.orElseThrow(() -> new IllegalArgumentException("존재하지 않는 아이디입니다."));
		return MemberResponse.toResponse(member);
	}
}
