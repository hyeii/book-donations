package com.bookdone.book.document;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;
import org.springframework.data.elasticsearch.annotations.InnerField;
import org.springframework.data.elasticsearch.annotations.MultiField;

import com.bookdone.book.dto.BookAutoCompDto;
import com.bookdone.book.dto.BookDto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Document(indexName = "books")
@ToString
public class Book {
	@Id
	@Field(type = FieldType.Keyword, name = "ID")
	private String id;

	@MultiField(
		mainField = @Field(type = FieldType.Text, fielddata = true, name = "TITLE"),
		otherFields = @InnerField(suffix = "keyword", type = FieldType.Keyword)
	)
	private String title;

	@Field(type = FieldType.Text, index = false, name = "VOL")
	private String vol;
	@Field(type = FieldType.Text, index = false, name = "SERIES_TITLE")
	private String seriesTitle;
	@Field(type = FieldType.Text, index = false, name = "SERIES_NO")
	private String seriesNo;
	@Field(type = FieldType.Text, index = false, name = "AUTHOR")
	private String author;
	@Field(type = FieldType.Text, index = false, name = "EA_ISBN")
	private String eaIsbn;
	@Field(type = FieldType.Text, index = false, name = "EA_ADD_CODE")
	private String eaAddCode;
	@Field(type = FieldType.Text, index = false, name = "SET_ISBN")
	private String setIsbn;
	@Field(type = FieldType.Text, index = false, name = "SET_ADD_CODE")
	private String setAddCode;
	@Field(type = FieldType.Text, index = false, name = "PUBLISHER")
	private String publisher;
	@Field(type = FieldType.Text, index = false, name = "PAGE")
	private String page;
	@Field(type = FieldType.Text, index = false, name = "BOOK_SIZE")
	private String bookSize;
	@Field(type = FieldType.Text, index = false, name = "SUBJECT")
	private String subject;
	@Field(type = FieldType.Text, index = false, name = "TITLE_URL")
	private String titleUrl;
	@Field(type = FieldType.Text, index = false, name = "PUBLISHER_URL")
	private String publisherUrl;
	@Field(type = FieldType.Text, index = false, name = "INPUT_DATE")
	private String inputDate;
	@Field(type = FieldType.Text, index = false, name = "UPDATE_DATE")
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

	public BookAutoCompDto toAutoCompDto() {
		return BookAutoCompDto.builder()
			.title(this.title)
			.isbn(this.eaIsbn)
			.build();
	}
}
