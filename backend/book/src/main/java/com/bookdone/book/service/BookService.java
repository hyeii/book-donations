package com.bookdone.book.service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.bookdone.book.dto.BookDto;
import com.bookdone.book.entity.Book;
import com.bookdone.book.repository.BookRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookService {

	private final BookRepository bookRepository;

	public List<Book> searchBookList(String title) {
		return bookRepository.findByTitleContaining(title);
	}

	public BookDto getBookDetail(String isbn) {
		return bookRepository.findByIsbn(isbn)
			.map(Book::toDto)
			.orElseThrow(() -> new IllegalArgumentException("책을 찾을 수 없습니다"));
	}

	public List<BookDto> getBooksDetail(List<String> isbnList) {
		return bookRepository.findByIsbnIn(isbnList)
			.stream().map(Book::toDto).collect(Collectors.toList());
	}
}
