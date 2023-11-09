package com.bookdone.book.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
public class LikesResponseDto {
	private BookDto book;
	private String localCode;
	private int count;
	private boolean isLikes;
}
