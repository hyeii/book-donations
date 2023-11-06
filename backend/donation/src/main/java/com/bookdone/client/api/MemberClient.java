package com.bookdone.client.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@FeignClient(name = "member-service")
public interface MemberClient {
    @GetMapping("/api/members/nicknames/{memberId}")
    ResponseEntity<?> getNickname(@PathVariable Long memberId);

    @GetMapping("/api/members/nicknames")
    ResponseEntity<?> getNicknameList(@RequestParam List<Long> memberIdList);
}
