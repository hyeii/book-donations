package com.bookdone.auth.service;

import com.bookdone.auth.dto.request.JoinMemberRequest;
import com.bookdone.auth.dto.response.AuthResponse;
import com.bookdone.auth.dto.response.MemberResponse;
import com.bookdone.global.client.MemberServiceClient;
import com.bookdone.global.jwt.JwtPayloadDto;
import com.bookdone.global.util.FeignResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.time.Duration;

@Service
@RequiredArgsConstructor
@Slf4j
public class AuthService {

    private final MemberServiceClient memberServiceClient;
    private final RedisTemplate<String, String> template;

    public AuthResponse login(JwtPayloadDto memberData) throws RuntimeException, JsonProcessingException {
        boolean newMember = false;
        MemberResponse member;
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            log.info("시작");
            ResponseEntity<Object> response = memberServiceClient.getMember(memberData.getSub());
            member = FeignResponse.extractDataFromResponse(response, MemberResponse.class);
            log.info("{}", member);
        } catch (Exception e) {
            log.error("login error : {}", e.getMessage());
            ResponseEntity<Object> response = memberServiceClient.join(JoinMemberRequest.createJoinMemberRequest(memberData));
            member = FeignResponse.extractDataFromResponse(response, MemberResponse.class);
        }

        AuthResponse authResponse = AuthResponse.create(member, newMember);
        template.opsForValue()
                .set("refresh " + member.getId(), authResponse.getRefreshToken(), Duration.ofDays(20));

        return authResponse;
    }
}
