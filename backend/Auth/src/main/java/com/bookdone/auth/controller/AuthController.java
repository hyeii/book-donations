package com.bookdone.auth.controller;

import com.bookdone.auth.dto.response.AuthResponse;
import com.bookdone.auth.service.AuthService;
import com.bookdone.global.jwt.JwtPayloadDto;
import com.bookdone.global.response.BaseResponse;
import com.bookdone.global.util.OidcUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/auth")
@Slf4j
public class AuthController {

    private final OidcUtil oidcUtil;
    private final AuthService authService;

    @PostMapping
    public ResponseEntity<?> oidcLogin(@RequestHeader("Authorization") String idToken) throws JsonProcessingException {
        log.info("login -call");
        JwtPayloadDto memberData;

        memberData = oidcUtil.decodeIdToken(idToken);
        AuthResponse token = authService.login(memberData);
        return BaseResponse.okWithData(HttpStatus.OK, "로그인 완료", token);
    }
}
