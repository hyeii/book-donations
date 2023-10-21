package com.bookdone.global.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "user-service")
public interface MemberServiceClient {

    @GetMapping("/api/members/oauth-id/{oauthId}")
    ResponseEntity<Object> getMember(@PathVariable String oauthId);

}
