package com.bookdona.client;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(name = "donation-service")
public interface DonationClient {

	@GetMapping
	ResponseEntity<?> getDonationInfo(Long donationId);

	@GetMapping
	ResponseEntity<?> getBookInfoList(List<Long> donationIdList);
}
