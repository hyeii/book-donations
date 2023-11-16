package com.bookdone.book.dto;

import com.bookdone.book.entity.Book;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookDto {
	private Long id;
	private String title;
	private String vol;
	private String seriesTitle;
	private String seriesNo;
	private String author;
	private String isbn;
	private String eaAddCode;
	private String setIsbn;
	private String setAddCode;
	private String publisher;
	private String page;
	private String bookSize;
	private String subject;
	private String titleUrl;
	private String publisherUrl;
	private String inputDate;
	private String updateDate;
	private boolean likeStatus;

}
