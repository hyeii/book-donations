package com.bookdone.member.dto.response;

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

    private Integer point;

    private String email;

    private String image;

    public static MemberResponse toResponse(Member member) {
        return MemberResponse.builder()
                .id(member.getId())
                .oauthId(member.getOauthId())
                .nickname(member.getNickname())
                .address(member.getAddress())
                .point(member.getPoint())
                .email(member.getEmail())
                .image(member.getImage())
                .build();
    }

}
