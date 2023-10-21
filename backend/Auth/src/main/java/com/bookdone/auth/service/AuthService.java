package com.bookdone.auth.service;

import com.bookdone.auth.dto.response.MemberResponse;
import com.bookdone.global.client.MemberServiceClient;
import com.bookdone.global.jwt.JwtPayloadDto;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class AuthService {

    private final MemberServiceClient memberServiceClient;

    public void login(JwtPayloadDto memberData) {

        MemberResponse member;
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            log.info("시작");
            member = objectMapper.convertValue(
                    memberServiceClient.getMember(memberData.getSub()).getBody(),
                    MemberResponse.class);
            log.info("{}",member);
        } catch (Exception e) {
            System.out.println("존재하지않음");
        }

    }
}
