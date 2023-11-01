package com.bookdone.book.entity;

import javax.persistence.*;

import com.bookdone.book.dto.BookDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "book") // 테이블명을 지정
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@Column(name = "TITLE", length = 5000)
	private String title;

	@Column(name = "VOL", length = 1000)
	private String vol;

	@Column(name = "SERIES_TITLE", length = 5000)
	private String seriesTitle;

	@Column(name = "SERIES_NO", length = 1000)
	private String seriesNo;

	@Column(name = "AUTHOR", length = 5000)
	private String author;

	@Column(name = "EA_ISBN", length = 1000)
	private String isbn;

	@Column(name = "EA_ADD_CODE", length = 1000)
	private String eaAddCode;

	@Column(name = "SET_ISBN", length = 1000)
	private String setIsbn;

	@Column(name = "SET_ADD_CODE", length = 1000)
	private String setAddCode;

	@Column(name = "SUBJECT", length = 5000)
	private String subject;

	@Column(name = "TITLE_URL", length = 5000)
	private String titleUrl;

	@Column(name = "PUBLISHER_URL", length = 5000)
	private String publisherUrl;

	@Column(name = "INPUT_DATE", length = 500)
	private String inputDate;

	@Column(name = "UPDATE_DATE", length = 500)
	private String updateDate;

	@Column(name = "BOOK_SIZE", length = 1000)
	private String bookSize;

	@Column(name = "PAGE", length = 1000)
	private String page;

	@Column(name = "PUBLISHER", length = 5000)
	private String publisher;

	public BookDto toDto() {
		BookDto bookDto = new BookDto();
		bookDto.setId(this.id);
		bookDto.setTitle(this.title);
		bookDto.setVol(this.vol);
		bookDto.setSeriesTitle(this.seriesTitle);
		bookDto.setSeriesNo(this.seriesNo);
		bookDto.setAuthor(this.author);
		bookDto.setIsbn(this.isbn);
		bookDto.setEaAddCode(this.eaAddCode);
		bookDto.setSetIsbn(this.setIsbn);
		bookDto.setSetAddCode(this.setAddCode);
		bookDto.setSubject(this.subject);
		bookDto.setTitleUrl(this.titleUrl);
		bookDto.setPublisherUrl(this.publisherUrl);
		bookDto.setInputDate(this.inputDate);
		bookDto.setUpdateDate(this.updateDate);
		bookDto.setBookSize(this.bookSize);
		bookDto.setPage(this.page);
		bookDto.setPublisher(this.publisher);
		return bookDto;
	}
}