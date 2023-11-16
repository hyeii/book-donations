package com.bookdona.client.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FeignBookInfo {

	private Long donationId;
	private String bookImage;
	private String bookTitle;

	@Getter
	@NoArgsConstructor
	@AllArgsConstructor
	@Builder
	public static class BookInfo {
		String bookImage;
		String bookTitle;
	}

	public BookInfo getBookInfo() {
		return new BookInfo(bookImage, bookTitle);
	}
}
