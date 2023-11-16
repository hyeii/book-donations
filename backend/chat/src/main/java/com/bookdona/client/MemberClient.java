package com.bookdona.client;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.context.annotation.Profile;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Profile("!local")
@FeignClient(name = "member-service", contextId = "memberClient", path = "/api/members")
public interface MemberClient {

	@GetMapping("/{member-id}")
	ResponseEntity<?> getMemberByMemberId(@PathVariable("member-id") Long id);

	@GetMapping
	ResponseEntity<?> getMemberInfoList(List<Long> memberIdList);
}