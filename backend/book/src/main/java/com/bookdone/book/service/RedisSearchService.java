package com.bookdone.book.service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.bookdone.book.entity.RedisBook;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class RedisSearchService {

	private RedisTemplate<String, RedisBook> redisTemplate;

	public RedisSearchService(RedisTemplate<String, RedisBook> redisTemplate) {
		this.redisTemplate = redisTemplate;
	}

	public List<RedisBook> searchAndSortByTitle(String title) {
		String sortedSetKey = "books_sorted_set"; // Redis Sorted Set의 키

		// Redis Sorted Set에서 스코어가 query를 포함하는 데이터를 찾아내기
		Set<RedisBook> matchingData = redisTemplate.opsForZSet().rangeByScore(
			sortedSetKey,
			Double.NEGATIVE_INFINITY,
			Double.POSITIVE_INFINITY,
			0,
			-1
		);

		List<RedisBook> sortedList = matchingData.stream()
			.filter(redisBook -> redisBook.getTitle().contains(title))
			.collect(Collectors.toList());

		log.info("searchList: {}", sortedList);
		return sortedList;
	}
}
