package com.bookdone.member.dto.request;

import com.bookdone.member.entity.Member;
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

    public Member toEntity() {
        return Member
                .builder()
                .oauthId(oauthId)
                .nickname(nickname)
                .email(email)
                .point(3)
                .roles("USER_ROLE")
                .address("")
                .image("")
                .build();
    }
}
