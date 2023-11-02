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
	private Long id;

	@Lob  // TEXT 타입에는 @Lob 어노테이션을 사용합니다.
	private String title;

	@Column(length = 100)  // VARCHAR 타입에는 length 속성을 사용합니다.
	private String vol;

	@Lob
	private String seriesTitle;

	@Column(length = 100)
	private String seriesNo;

	@Lob
	private String author;

	@Column(length = 100, name = "ea_isbn")
	private String isbn;

	@Column(length = 100)
	private String eaAddCode;

	@Column(length = 100)
	private String setIsbn;

	@Column(length = 100)
	private String setAddCode;

	@Column(length = 150)
	private String publisher;

	@Column(length = 100)
	private String page;

	@Column(length = 100)
	private String bookSize;

	@Column(length = 100)
	private String subject;

	@Lob
	private String titleUrl;

	@Lob
	private String publisherUrl;

	@Column(length = 100)
	private String inputDate;

	@Column(length = 100)
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