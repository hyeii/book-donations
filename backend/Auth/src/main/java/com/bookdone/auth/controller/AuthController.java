package com.bookdone.auth.controller;

import com.bookdone.auth.service.AuthService;
import com.bookdone.global.jwt.JwtPayloadDto;
import com.bookdone.global.util.OidcUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/auth")
@Slf4j
public class AuthController {

	private final OidcUtil oidcUtil;
	private final AuthService authService;

	@PostMapping
	public ResponseEntity<?> oidcLogin(@RequestHeader("Authorization") String idToken){
		log.info("login -call");
		JwtPayloadDto memberData;
		try {
			memberData = oidcUtil.decodeIdToken(idToken);
			authService.login(memberData);
		} catch (JsonProcessingException e) {
			throw new RuntimeException(e);
		}
		return ResponseEntity.ok().body("");
	}

}
