package com.bookdone.global.response;

import com.bookdone.member.entity.Member;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberResponse {

    private Long id;

    private String oauthId;

    private String nickname;

    private String address;

    private String fcmToken;

    private Integer point;

    private String image;

    public static MemberResponse toResponse(Member member) {
        return MemberResponse.builder()
                .id(member.getId())
                .oauthId(member.getOauthId())
                .nickname(member.getNickname())
                .address(member.getAddress())
                .fcmToken(member.getFcmToken())
                .point(member.getPoint())
                .image(member.getImage())
                .build();
    }
}
