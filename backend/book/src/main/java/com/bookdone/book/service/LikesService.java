package com.bookdone.book.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookdone.book.dto.LikesRequestDto;
import com.bookdone.book.dto.LikesResponseDto;
import com.bookdone.book.entity.Book;
import com.bookdone.book.entity.Likes;
import com.bookdone.book.repository.BookRepository;
import com.bookdone.book.repository.LikesRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class LikesService {

	private final LikesRepository likesRepository;
	private final BookRepository bookRepository;

	/*	TODO: 미완성
		article server에게 요청해서 특정 지역 특정 책 -> count 계산하고
		내가 관심도서로 지정한 책이 있다면, 관심도서 표시 o
		내가 관심도서로 지정한 책이 아니면, 관심도서 표시 x
	 */
	@Transactional
	public List<LikesResponseDto> getLikesBooks(long memberId) {
		List<Likes> likes = likesRepository.findByMemberId(memberId);

		// article server 에게 개수 요청

		return likes.stream()
			.map(like -> {
				LikesResponseDto dto = new LikesResponseDto();
				dto.setBook(like.getBook().toDto(true));
				dto.setLocalCode(like.getLocalCode());
				dto.setCount(1); // article 서버에게 요청해서 개수를 받아와야 함
				dto.setLikes(true);
				return dto;
			})
			.collect(Collectors.toList());
	}

	public boolean toggleLikesBook(long memberId, LikesRequestDto likesRequestDto) {
		Book book = bookRepository.findByIsbn(likesRequestDto.getIsbn())
			.orElseThrow(() -> new IllegalArgumentException("책이 없습니다."));

		Optional<Likes> existingLikes = likesRepository.findByMemberIdAndBookAndLocalCode(
			memberId, book, likesRequestDto.getLocalCode());

		// 기존 좋아요 삭제
		if (existingLikes.isPresent()) {
			likesRepository.delete(existingLikes.get());
			return false;
		} else { // 좋아요 등록
			Likes newLikes = Likes.builder()
				.memberId(memberId)
				.book(book)
				.localCode(likesRequestDto.getLocalCode())
				.build();
			likesRepository.save(newLikes);
			return true;
		}
	}

	public List<String> getMemberList(String isbn) {
		try {
			Book book = bookRepository.findByIsbn(isbn)
				.orElseThrow(() -> new IllegalArgumentException("책이 없습니다."));
			return likesRepository.findAllByBookId(book.getId())
				.stream()
				.map(Likes::getMemberId)
				.map(String::valueOf)
				.collect(Collectors.toList());
		} catch (Exception e) {
			log.info("[ERROR] {}", e.getMessage());
			return new ArrayList<>();
		}
	}
}
