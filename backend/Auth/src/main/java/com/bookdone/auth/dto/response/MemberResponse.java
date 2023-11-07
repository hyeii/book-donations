package com.bookdone.auth.dto.response;

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

    private String email;

    private String image;

}
