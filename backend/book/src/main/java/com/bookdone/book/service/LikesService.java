package com.bookdone.book.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.bookdone.book.dto.BookDto;
import com.bookdone.book.dto.LikesRequestDto;
import com.bookdone.book.dto.LikesResponseDto;
import com.bookdone.book.entity.Likes;
import com.bookdone.book.repository.BookRepository;
import com.bookdone.book.repository.LikesRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class LikesService {

	LikesRepository likesRepository;
	BookRepository bookRepository;

	public List<LikesResponseDto> getLikesBooks(long memberId) {
		List<Likes> likes = likesRepository.findByMemberId(memberId);
		// 지역별 count
		Map<Integer, Long> localCodeCounts = likes.stream()
			.collect(Collectors.groupingBy(Likes::getLocalCode, Collectors.counting()));

		return likes.stream()
			.map(like -> {
				LikesResponseDto dto = new LikesResponseDto();
				dto.setBook(like.getBook().toDto());
				dto.setLocalCode(like.getLocalCode());
				dto.setCount(Math.toIntExact(localCodeCounts.get(like.getLocalCode())));
				return dto;
			})
			.collect(Collectors.toList());
	}

	public void addLikesBook(long memberId, LikesRequestDto likesRequestDto) {
		Likes likes = Likes.builder()
			.memberId(memberId)
			.book(bookRepository.findByIsbn(likesRequestDto.getIsbn())
				.orElseThrow(() -> new IllegalArgumentException("책이 없습니다.")))
			.localCode(likesRequestDto.getLocalCode())
			.build();
		likesRepository.save(likes);
	}

	public void deleteLikesBook(long memberId, LikesRequestDto likesRequestDto) {
		Likes likes = likesRepository.findByMemberIdAndBookIsbnAndLocalCode(
				memberId, likesRequestDto.getIsbn(), likesRequestDto.getLocalCode())
			.orElseThrow(() -> new IllegalArgumentException("좋아요를 해당 누른 책이 없습니다."));
		likesRepository.delete(likes);
	}
}
