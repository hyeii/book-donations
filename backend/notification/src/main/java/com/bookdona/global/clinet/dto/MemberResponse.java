package com.bookdona.global.clinet.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class MemberResponse {

    private Long id;

    private String oauthId;

    private String nickname;

    private String address;

    private String fcmToken;

    private Integer point;

    private String image;
}
