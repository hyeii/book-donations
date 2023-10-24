package com.bookdone.client.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;

@FeignClient(name="member-service")
public interface MemberClient {
	@GetMapping("/me")
	ResponseEntity<?> getMemberInfo(@RequestHeader("member-id") long memberId);

}
