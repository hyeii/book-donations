package com.bookdone.user.controller;

import com.bookdone.user.service.MemberService;
import javax.servlet.http.HttpServletRequest;

import org.springframework.core.env.Environment;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
		return "It`s Working in User Service";
	}

	@GetMapping("/message")
	public String message(@RequestHeader("user-request") String header) {
		return header;
	}

	@GetMapping("/check")
	public String check(HttpServletRequest request) {
		System.out.println(request.getServerPort());

		return "user check:"+env.getProperty("local.server.port");
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
}
