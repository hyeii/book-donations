package com.bookdone.global.security;

import com.bookdone.auth.dto.response.MemberResponse;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * 현재 액세스 토큰으로 부터 인증된 유저의 부가 상세정보(활성화 여부, 만료, 롤 등) 정의.
 */
@NoArgsConstructor
@AllArgsConstructor
public class CustomMemberDetails implements UserDetails {
    boolean accountNonExpired;
    boolean accountNonLocked;
    boolean credentialNonExpired;
    boolean enabled = false;
    List<String> roles = new ArrayList<>();
    private MemberResponse member;

    public CustomMemberDetails(MemberResponse member) {
        super();
        this.member = member;
        this.roles = new ArrayList<>(); //
    }

    public MemberResponse getUser() {
        return this.member;
    }

    @Override
    public String getPassword() {
        return null;
    }

    @Override
    public String getUsername() {
        return String.valueOf(this.member.getOauthId());
    }

    public Long getPK() {
        return  this.member.getId();
    }

    @Override
    public boolean isAccountNonExpired() {
        return this.accountNonExpired;
    }

    @Override
    public boolean isAccountNonLocked() {
        return this.accountNonLocked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return this.credentialNonExpired;
    }

    @Override
    public boolean isEnabled() {
        return this.enabled;
    }

    // @Override
    // public Collection<? extends GrantedAuthority> getAuthorities() {
    // 	return this.roles;
    // }
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles.stream()
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());
    }

    public String getNickname() {
        return this.member.getNickname();
    }

}
