package com.bookdone.member.service;

import com.bookdone.member.dto.request.AdditionalInfo;
import com.bookdone.member.dto.request.JoinMemberRequest;
import com.bookdone.global.response.MemberResponse;
import com.bookdone.member.entity.Member;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import com.bookdone.member.repository.MemberRepository;

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

	@Transactional
	public void updateJoinMember(String memberId, AdditionalInfo additionalInfo) {
		Member member = memberRepository.findById(memberId)
				.orElseThrow(() -> new IllegalArgumentException("존재하지 않는 회원입니다."));
		member.updateNicknameAndAddress(
				additionalInfo.getNickname(), additionalInfo.getAddress()
		);
	}
}
