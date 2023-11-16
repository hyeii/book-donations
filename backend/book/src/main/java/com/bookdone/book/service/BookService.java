package com.bookdone.book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookdone.book.dto.BookDto;
import com.bookdone.book.dto.BookTitleUrlDto;
import com.bookdone.book.entity.Book;
import com.bookdone.book.entity.Likes;
import com.bookdone.book.repository.BookRepository;
import com.bookdone.book.repository.LikesRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookService {

	private final BookRepository bookRepository;
	private final LikesRepository likesRepository;

	@Transactional
	public void addTitleImage(List<BookTitleUrlDto> bookTitleUrlDtoList) {
		for (BookTitleUrlDto dto : bookTitleUrlDtoList) {
			bookRepository.updateTitleUrlByIsbn(dto.getIsbn(), dto.getTitleUrl());
		}
	}

	public List<Book> searchBookList(String title) {
		return bookRepository.findByTitleContaining(title);
	}

	public BookDto getBookDetail(String isbn, long memberId) {

		return bookRepository.findByIsbn(isbn)
			.map(book -> {
				Optional<Likes> byMemberIdAndBook = likesRepository.findByMemberIdAndBook(memberId, book);
				if (byMemberIdAndBook.isPresent()) {
					return book.toDto(true);
				}
				return book.toDto(false);
	})
			.orElseThrow(() -> new IllegalArgumentException("책을 찾을 수 없습니다"));
	}

	@Transactional
	public Map<String, BookDto> getBooksDetailMap(List<String> isbnList) {
		Map<String, BookDto> booksMap = new HashMap<>();
		for (String isbn : isbnList) {
			bookRepository.findByIsbn(isbn)
				.ifPresent(book -> booksMap.put(isbn, book.toDto(false)));
		}
		return booksMap;
	}
}
