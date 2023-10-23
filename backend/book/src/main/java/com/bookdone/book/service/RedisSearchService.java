package com.bookdone.book.service;

import java.util.Set;

import org.springframework.data.redis.connection.RedisZSetCommands;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class RedisSearchService {
	//private final RedisTemplate<String, RedisBook> redisTemplate;
	private final RedisTemplate<String, String> redisTemplate2;

	public Set<String> getAutocompleteSuggestions(String query) {
		ZSetOperations<String, String> zSetOperations = redisTemplate2.opsForZSet();
		return zSetOperations.rangeByLex("autocomplete:titles", RedisZSetCommands.Range.range().gte(query).lte(query + "\uffff"));
	}
}
