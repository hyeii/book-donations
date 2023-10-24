package com.bookdone.member.entity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.Table;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;


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

    private Integer point;

    @Column(length = 25)
    private String email;

    private String image;

    private String roles;

    public List<String> getRoleList() {
        if (this.roles.length() > 0) {
            return Arrays.asList(this.roles.split(","));
        }
        return new ArrayList<>();
    }

    public void updateNicknameAndAddress(String nickname, String address) {
        this.nickname = nickname;
        this.address = address;
    }
}
