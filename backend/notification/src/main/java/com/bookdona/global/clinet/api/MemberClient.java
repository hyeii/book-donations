package com.bookdona.global.clinet.api;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "member-service")
public interface MemberClient {

	@GetMapping("/api/members")
	public ResponseEntity<?> getMembers(@RequestBody List<Long> memberIds);

	@GetMapping("/api/members/{member-id}")
	public ResponseEntity<?> getMemberByMemberId(@PathVariable("member-id") Long memberId);
}
