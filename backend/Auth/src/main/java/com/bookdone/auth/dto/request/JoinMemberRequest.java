package com.bookdone.auth.dto.request;

import com.bookdone.global.jwt.JwtPayloadDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class JoinMemberRequest {

    private String oauthId;
    private String nickname;
    private String email;


    public static JoinMemberRequest createJoinMemberRequest(JwtPayloadDto memberData) {
        return JoinMemberRequest.builder()
                .email(memberData.getEmail())
                .nickname(memberData.getNickname())
                .oauthId(memberData.getSub())
                .build();
    }
}
