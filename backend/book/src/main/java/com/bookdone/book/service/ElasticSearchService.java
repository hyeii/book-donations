package com.bookdone.book.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.bookdone.book.document.Book;
import com.bookdone.book.dto.BookDto;
import com.bookdone.book.repository.ElasticSearchRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ElasticSearchService {

	private final ElasticSearchRepository elasticSearchRepository;

	public List<BookDto> searchBookList(String title) {
		return elasticSearchRepository.searchByTitle(title).stream()
			.map(Book::toDto)
			.collect(Collectors.toList());
	}
}
