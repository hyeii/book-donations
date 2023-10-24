package com.bookdone.member.controller;

import com.bookdone.global.response.BaseResponse;
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
    public String status() {
        return "It`s Working in Member Service";
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
        return ResponseEntity.ok(memberService.findByOauthId(oauthId));
    }

    @PostMapping("/join")
    public ResponseEntity<?> join(@RequestBody JoinMemberRequest joinMemberRequest) {
        return ResponseEntity.ok(memberService.join(joinMemberRequest));
    }

    @PatchMapping("additional-info")
    public ResponseEntity<?> additionalInfo(@RequestHeader("member-id") String memberId, @RequestBody AdditionalInfo additionalInfo) {
        memberService.updateJoinMember(memberId, additionalInfo);
        return BaseResponse.ok(HttpStatus.OK, "추가 정보 삽입 완료");
    }
}