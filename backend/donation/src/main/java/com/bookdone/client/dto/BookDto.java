package com.bookdone.client.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
}

