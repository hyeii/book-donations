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
public class FeignBookInfoList {

	List<FeignBookInfo> feignBookInfoList;

	public Map<Long, FeignBookInfo.BookInfo> toMap() {

		return feignBookInfoList.stream()
			.collect(Collectors.toMap(FeignBookInfo::getDonationId,
				FeignBookInfo::getBookInfo));

	}
}
