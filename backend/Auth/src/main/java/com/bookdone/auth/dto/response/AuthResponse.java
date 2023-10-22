package com.bookdone.auth.dto.response;

import com.bookdone.global.util.JwtTokenUtil;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
public class AuthResponse {

    private MemberResponse member;
    private String accessToken;
    private String refreshToken;
    private boolean newUser;
    public static AuthResponse create(MemberResponse member,boolean newUser) {
        return AuthResponse
                .builder()
                .member(member)
                .accessToken(JwtTokenUtil.getAccessToken(String.valueOf(member.getId())))
                .refreshToken(JwtTokenUtil.getRefreshToken(String.valueOf(member.getId())))
                .newUser(newUser)
                .build();
    }
}
