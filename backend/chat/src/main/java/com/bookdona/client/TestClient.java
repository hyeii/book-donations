package com.bookdona.client;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.context.annotation.Profile;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;

import com.bookdona.client.dto.FeignMember;
import com.bookdona.global.response.BaseResponse;

import lombok.extern.slf4j.Slf4j;

@Profile("local")
@Component
@Slf4j
public class TestClient implements MemberClient {
	@Override
	public ResponseEntity<?> getMemberByMemberId(@PathVariable("member-id") Long id) {
		log.info("Returning test member information for id: {}", id);
		FeignMember testMember = FeignMember.builder()
			.id(id)
			.nickname(String.valueOf(id))
			.build();
		return BaseResponse.okWithData(HttpStatus.OK, "테스트용 멤버 반환", testMember);
	}

	@Override
	public ResponseEntity<?> getMemberInfoList(List<Long> memberIdList) {
		log.info("Member info list request for ids: {}", memberIdList);
		return BaseResponse.okWithData(HttpStatus.OK, "테스트용 멤버 목록 반환", null);
	}
}