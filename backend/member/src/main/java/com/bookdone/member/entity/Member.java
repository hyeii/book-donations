package com.bookdone.member.entity;

import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@Getter
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Entity
@Table(indexes = {
        @Index(name = "idx_oauth_id", columnList = "oauth_id"),
        @Index(name = "idx_nickname", columnList = "nickname")
})
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "oauth_id", unique = true)
    private String oauthId;

    @Column(length = 20, unique = true)
    private String nickname;

    private String address;

    @Column(columnDefinition = "integer default 0")
    private Integer point;

    @Column(length = 300)
    private String fcmToken;

    private String image;

    private String roles;


    public List<String> getRoleList() {
        if (this.roles.length() > 0) {
            return Arrays.asList(this.roles.split(","));
        }
        return new ArrayList<>();
    }

    public void updateNicknameAndAddress(String nickname, String address, String fcmToken) {
        this.nickname = nickname;
        this.address = address;
        this.fcmToken = fcmToken;
    }

    public void updateImage(String image) {
        this.image = image;
    }
}
