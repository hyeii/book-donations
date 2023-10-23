package com.bookdone.global.client;

import com.bookdone.auth.dto.request.JoinMemberRequest;
import com.bookdone.auth.dto.response.MemberResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "member-service")
public interface MemberServiceClient {

    @GetMapping("/api/members/oauth-id/{oauthId}")
    ResponseEntity<Object> getMember(@PathVariable String oauthId);

    @PostMapping("/api/members/join")
    MemberResponse join(@RequestBody JoinMemberRequest joinMemberRequest);
}
