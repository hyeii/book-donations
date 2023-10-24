package com.bookdone.book.service;

import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.data.redis.connection.RedisZSetCommands;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;

import com.bookdone.book.dto.BookAutoCompDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class RedisSearchService {
	private final RedisTemplate<String, String> redisTemplate;

	public List<BookAutoCompDto> getAutocompleteSuggestionsWithISBN(String query) {
		ZSetOperations<String, String> zSetOperations = redisTemplate.opsForZSet();
		Set<String> titles = zSetOperations.rangeByLex("autocomplete:titles",
			RedisZSetCommands.Range.range().gte(query).lte(query + "\uffff"));

		return titles.stream()
			.filter(title -> title.startsWith(query))
			.sorted((title1, title2) -> Integer.compare(matchScore(title2, query), matchScore(title1, query)))
			.limit(10)
			.map(title -> {
				BookAutoCompDto dto = new BookAutoCompDto();
				dto.setTitle(title);
				String isbn = redisTemplate.opsForValue().get("autocomplete:title:" + title);
				if (isbn != null) {
					dto.setIsbn(isbn);
				}
				return dto;
			}).collect(Collectors.toList());
	}
	private int matchScore(String title, String query) {
		int score = 0;
		if (title.startsWith(query))
			score += 10;
		if (title.contains(query))
			score += 5;
		return score;
	}

	// ***** 완전탐색 코드
	// private final RedisTemplate<String, String> redisTemplate;
	//
	// public Set<BookAutoCompDto> getAutocompleteSuggestionsWithISBN(String query) {
	// 	Set<String> keys = redisTemplate.keys("autocomplete:title:*" + query + "*");
	// 	if (keys == null) {
	// 		return Collections.emptySet();
	// 	}
	//
	// 	return keys.stream().map(key -> {
	// 		String title = key.substring("autocomplete:title:".length());
	// 		BookAutoCompDto dto = new BookAutoCompDto();
	// 		dto.setTitle(title);
	//
	// 		String isbn = redisTemplate.opsForValue().get(key);
	//
	// 		if (isbn != null) {
	// 			dto.setIsbn(isbn);
	// 		}
	//
	// 		return dto;
	// 	}).collect(Collectors.toSet());
	// }
}
