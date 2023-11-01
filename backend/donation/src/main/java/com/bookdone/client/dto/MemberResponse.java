package com.bookdone.client.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberResponse {
    private Long id;
    private String oauthId;
    private String nickname;
    private Integer address;
    private Integer point;
    private String email;
    private String image;
}
