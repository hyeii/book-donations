package com.bookdone.book.document;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import com.bookdone.book.dto.BookDto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Document(indexName = "books")
public class Book {
	@Id
	private String id;

	@Field(type = FieldType.Text)
	private String title; // 검색에 사용될 필드

	// 검색에 사용되지 않는 필드들에 대해선 index = false 설정
	@Field(type = FieldType.Integer, index = false)
	private String vol;
	@Field(type = FieldType.Text, index = false)
	private String seriesTitle;
	@Field(type = FieldType.Integer, index = false)
	private String seriesNo;
	@Field(type = FieldType.Text, index = false)
	private String author;
	@Field(type = FieldType.Keyword, index = false)
	private String eaIsbn;
	@Field(type = FieldType.Keyword, index = false)
	private String eaAddCode;
	@Field(type = FieldType.Keyword, index = false)
	private String setIsbn;
	@Field(type = FieldType.Keyword, index = false)
	private String setAddCode;
	@Field(type = FieldType.Text, index = false)
	private String publisher;
	@Field(type = FieldType.Integer, index = false)
	private String page;
	@Field(type = FieldType.Text, index = false)
	private String bookSize;
	@Field(type = FieldType.Text, index = false)
	private String subject;
	@Field(type = FieldType.Text, index = false)
	private String titleUrl;
	@Field(type = FieldType.Text, index = false)
	private String publisherUrl;
	@Field(type = FieldType.Date, index = false)
	private String inputDate;
	@Field(type = FieldType.Date, index = false)
	private String updateDate;

	public BookDto toDto() {
		return BookDto.builder()
			.id(this.id != null ? Long.valueOf(this.id) : null)
			.title(this.title)
			.vol(this.vol)
			.seriesTitle(this.seriesTitle)
			.seriesNo(this.seriesNo)
			.author(this.author)
			.isbn(this.eaIsbn)
			.eaAddCode(this.eaAddCode)
			.setIsbn(this.setIsbn)
			.setAddCode(this.setAddCode)
			.publisher(this.publisher)
			.page(this.page)
			.bookSize(this.bookSize)
			.subject(this.subject)
			.titleUrl(this.titleUrl)
			.publisherUrl(this.publisherUrl)
			.inputDate(this.inputDate)
			.updateDate(this.updateDate)
			.build();
	}
}
