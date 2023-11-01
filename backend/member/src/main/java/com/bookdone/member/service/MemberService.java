package com.bookdone.member.service;

import com.bookdone.global.response.MemberResponse;
import com.bookdone.member.dto.request.AdditionalInfo;
import com.bookdone.member.dto.request.JoinMemberRequest;
import com.bookdone.member.entity.Member;
import com.bookdone.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberService {

    private final MemberRepository memberRepository;

    public MemberResponse findByOauthId(String oauthId) {
        Member member = memberRepository.findByOauthId(oauthId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 아이디입니다"));
        return MemberResponse.toResponse(member);
    }

    public MemberResponse findById(Long id) {
        Member member = memberRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("id가 일치하는 회원이 없습니다"));
        return MemberResponse.toResponse(member);
    }

    public Map<Long, MemberResponse> findByMemberIds(List<Long> memberIds) {
        List<Member> members = memberRepository.findByIdIn(memberIds);
        return members.stream()
                .collect(Collectors.toMap(Member::getId, member -> MemberResponse.toResponse(member)));
    }

    @Transactional
    public MemberResponse join(JoinMemberRequest joinMemberRequest) {
        Member member = joinMemberRequest.toEntity();
        memberRepository.save(member);
        log.info("member join - {}", member);
        return MemberResponse.toResponse(member);
    }

    @Transactional
    public void updateJoinMember(Long id, AdditionalInfo additionalInfo) {
        Member member = memberRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("id가 일치하는 회원이 없습니다"));
        member.updateNicknameAndAddress(
                additionalInfo.getNickname(), additionalInfo.getAddress()
        );
    }

    @Transactional
    public void updateImage(Long id, String image) {
        Member member = memberRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("id가 일치하는 회원이 없습니다."));
        member.updateImage(image);
    }
}
