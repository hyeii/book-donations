package com.bookdona.client.dto;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FeignMemberList {

	List<FeignMember> feignMemberList;

	public Map<Long, String> toMap() {
		return feignMemberList.stream()
			.collect(Collectors.toMap(FeignMember::getId, FeignMember::getNickname));
	}
}
