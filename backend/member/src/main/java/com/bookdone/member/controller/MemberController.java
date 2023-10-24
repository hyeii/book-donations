package com.bookdone.member.controller;

import com.bookdone.global.response.BaseResponse;
import com.bookdone.global.response.MemberResponse;
import com.bookdone.member.dto.request.AdditionalInfo;
import com.bookdone.member.dto.request.JoinMemberRequest;
import com.bookdone.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/members")
@RequiredArgsConstructor
public class MemberController {

    private final Environment env;
    private final MemberService memberService;

    @GetMapping("/health_check")
    public String status(@RequestHeader("member-id") String memberId) {
        return "It`s Working in Member Service , memberId : " + memberId;
    }

    @GetMapping("/message")
    public String message(@RequestHeader("member-request") String header) {
        return header;
    }

    @GetMapping("/check")
    public String check(HttpServletRequest request) {
        System.out.println(request.getServerPort());
        return "member check:" + env.getProperty("local.server.port");
    }

    @GetMapping("/oauth-id/{oauthId}")
    public ResponseEntity<?> getMember(@PathVariable String oauthId) {
        return BaseResponse.okWithData(HttpStatus.OK, "멤버 조회 완료", memberService.findByOauthId(oauthId));
    }

    @GetMapping("/me")
    public ResponseEntity<?> getCurrentMember(@RequestHeader("member-id") Long memberId) {
        MemberResponse member = memberService.findById(memberId);
        return BaseResponse.okWithData(HttpStatus.OK, "멤버 조회 완료", member);
    }

    @PostMapping("/join")
    public ResponseEntity<?> join(@RequestBody JoinMemberRequest joinMemberRequest) {
        return BaseResponse.okWithData(
                HttpStatus.OK, "임시 회원 가입 완료", memberService.join(joinMemberRequest));
    }

    @PatchMapping("additional-info")
    public ResponseEntity<?> additionalInfo(@RequestHeader("member-id") Long memberId, @RequestBody AdditionalInfo additionalInfo) {
        memberService.updateJoinMember(memberId, additionalInfo);
        return BaseResponse.ok(HttpStatus.OK, "추가 정보 삽입 완료");
    }

    @PatchMapping("/me/image")
    public ResponseEntity<?> updateImage(@RequestHeader("member-id") Long memberId, String image) {
        memberService.updateImage(memberId, image);
        return BaseResponse.ok(HttpStatus.OK, "프로필 사진 업데이트 완료");
    }
}