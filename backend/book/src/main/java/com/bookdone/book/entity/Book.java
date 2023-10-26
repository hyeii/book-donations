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

	@Column(name = "TITLE")
	private String title;

	@Column(name = "VOL")
	private String vol;

	@Column(name = "SERIES_TITLE")
	private String seriesTitle;

	@Column(name = "SERIES_NO")
	private String seriesNo;

	@Column(name = "AUTHOR")
	private String author;

	@Column(name = "EA_ISBN")
	private String isbn;

	@Column(name = "EA_ADD_CODE")
	private String eaAddCode;

	@Column(name = "SET_ISBN")
	private String setIsbn;

	@Column(name = "SET_ADD_CODE")
	private String setAddCode;

	@Column(name = "SET_EXPRESSION")
	private String setExpression;

	@Column(name = "PUBLISHER")
	private String publisher;

	@Column(name = "EDITION_STMT")
	private String editionStmt;

	@Column(name = "PAGE")
	private String page;

	@Column(name = "BOOK_SIZE")
	private String bookSize;

	@Column(name = "SUBJECT")
	private String subject;

	@Column(name = "TITLE_URL")
	private String titleUrl;

	@Column(name = "BOOK_TB_CNT_URL")
	private String bookTbCntUrl;

	@Column(name = "BOOK_INTRODUCTION_URL")
	private String bookIntroductionUrl;

	@Column(name = "BOOK_SUMMARY_URL")
	private String bookSummaryUrl;

	@Column(name = "PUBLISHER_URL")
	private String publisherUrl;

	@Column(name = "INPUT_DATE")
	private String inputDate;

	@Column(name = "UPDATE_DATE")
	private String updateDate;

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
		bookDto.setSetExpression(this.setExpression);
		bookDto.setPublisher(this.publisher);
		bookDto.setEditionStmt(this.editionStmt);
		bookDto.setPage(this.page);
		bookDto.setBookSize(this.bookSize);
		bookDto.setSubject(this.subject);
		bookDto.setTitleUrl(this.titleUrl);
		bookDto.setBookTbCntUrl(this.bookTbCntUrl);
		bookDto.setBookIntroductionUrl(this.bookIntroductionUrl);
		bookDto.setBookSummaryUrl(this.bookSummaryUrl);
		bookDto.setPublisherUrl(this.publisherUrl);
		bookDto.setInputDate(this.inputDate);
		bookDto.setUpdateDate(this.updateDate);
		return bookDto;
	}
}
