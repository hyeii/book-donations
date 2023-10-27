package com.bookdona.client;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(name = "member-service")
public interface MemberClient {

	@GetMapping
	ResponseEntity<?> getMemberInfo(Long id);

	@GetMapping
	ResponseEntity<?> getMemberInfoList(List<Long> memberIdList);
}
