package com.bookdone.member.controller;

import com.bookdone.member.dto.request.JoinMemberRequest;
import com.bookdone.member.service.MemberService;
import javax.servlet.http.HttpServletRequest;

import org.springframework.core.env.Environment;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

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
		try {
			return ResponseEntity.ok(memberService.findByOauthId(oauthId));
		} catch (IllegalArgumentException e) {
			System.out.println(e.getMessage());
			return ResponseEntity.badRequest().body(e);
		}
	}

	@PostMapping("/join")
	public ResponseEntity<?> join(@RequestBody JoinMemberRequest joinMemberRequest) {
		return ResponseEntity.ok(memberService.join(joinMemberRequest));
	}
}
