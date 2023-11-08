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
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberService {

    private final MemberRepository memberRepository;

    public void updateMembersPointById(Long id, Boolean isPositive) {
        Member member = getMemberOrThrow(id);
        if (isPositive) {
            member.increasePoint();
        } else {
            member.decreasePoint();
        }
    }

    public MemberResponse findByOauthId(String oauthId) {
        Member member = memberRepository.findByOauthId(oauthId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 아이디입니다"));
        return MemberResponse.toResponse(member);
    }

    public MemberResponse findById(Long id) {
        Member member = getMemberOrThrow(id);
        return MemberResponse.toResponse(member);
    }

    public Map<Long, MemberResponse> findByMemberIds(List<Long> memberIds) {
        List<Member> members = memberRepository.findByIdIn(memberIds);
        return members.stream()
                .collect(Collectors.toMap(Member::getId, member -> MemberResponse.toResponse(member)));
    }

    public Map<Long, String> findNicknamesByMemberIds(List<Long> memberIds) {
        List<Member> members = memberRepository.findByIdIn(memberIds);
        return members.stream()
                .collect(Collectors.toMap(Member::getId, Member::getNickname));
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
        Member member = getMemberOrThrow(id);
        member.updateNicknameAndAddress(
                additionalInfo.getNickname(), additionalInfo.getAddress(), additionalInfo.getFcmToken()
        );
    }

    @Transactional
    public void updateImage(Long id, String image) {
        Member member = getMemberOrThrow(id);
        member.updateImage(image);
    }

    public Member getMemberOrThrow(Long id) {
        Member member = memberRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("id가 일치하는 회원이 없습니다"));
        return member;
    }

    public boolean isNicknameAvailable(String nickname) {
        Optional<Member> optionalMember = memberRepository.findByNickname(nickname);
        return !optionalMember.isPresent();
    }
}
