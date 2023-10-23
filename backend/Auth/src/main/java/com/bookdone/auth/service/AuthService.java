package com.bookdone.auth.service;

import com.bookdone.auth.dto.request.JoinMemberRequest;
import com.bookdone.auth.dto.response.AuthResponse;
import com.bookdone.auth.dto.response.MemberResponse;
import com.bookdone.global.client.MemberServiceClient;
import com.bookdone.global.jwt.JwtPayloadDto;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.time.Duration;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class AuthService {

    private final MemberServiceClient memberServiceClient;
    private final RedisTemplate<String, String> template;

    public AuthResponse login(JwtPayloadDto memberData) {
        boolean newMember = false;
        MemberResponse member;
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            log.info("시작");
            member = objectMapper.convertValue(
                    memberServiceClient.getMember(memberData.getSub()).getBody(),
                    MemberResponse.class);
            log.info("{}",member);
        } catch (Exception e) {
            log.error("login error : {}", e.getMessage());
            member = memberServiceClient.join(JoinMemberRequest.createJoinMemberRequest(memberData));
            newMember = true;
            log.info("join - {}", member);
        }

        AuthResponse authResponse = AuthResponse.create(member,newMember);
        template.opsForValue()
                .set("refresh " + member.getId(), authResponse.getRefreshToken(), Duration.ofDays(20));

        return authResponse;
    }
}
