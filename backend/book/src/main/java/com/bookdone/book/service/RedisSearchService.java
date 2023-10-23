package com.bookdone.book.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.redis.connection.RedisZSetCommands;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;
import com.bookdone.book.entity.RedisBook;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class RedisSearchService {
	private final RedisTemplate<String, RedisBook> redisTemplate;
	public List<RedisBook> searchBooksByTitleSubstring(String substring) {
		List<RedisBook> matchingBooks = new ArrayList<>();
		for (String key : redisTemplate.keys("book:*")) {
			RedisBook book = redisTemplate.opsForValue().get(key);
			String title = book.getTitle();

			// title 부분 문자열 검색
			if (title.contains(substring)) {
				matchingBooks.add(book);
			}
		}
		log.info("{}", matchingBooks);
		return matchingBooks;
	}


	// Redis Search Module 추가가 안됨
	// private final Client client;
	//
	// public RedisSearchService() {
	// 	redisTemplate = new RedisTemplate<>();
	// 	client = new Client("index_name", "localhost", 6379);
	// }
	//
	// public void createIndex() {
	// 	// 인덱스 생성 및 설정
	// 	IndexDefinition indexDefinition = new IndexDefinition(IndexType.HASH).addTextField("title");
	// 	client.createIndex(indexDefinition);
	// }
	//
	// public List<RedisBook> searchBooksByTitleSubstring(String substring) {
	// 	List<RedisBook> matchingBooks = new ArrayList<>();
	//
	// 	// 검색 실행
	// 	SearchResult result = client.search(substring);
	//
	// 	// 검색 결과 처리
	// 	for (Result doc : result) {
	// 		String key = doc.getString("id");
	// 		RedisBook book = redisTemplate.opsForValue().get(key);
	// 		matchingBooks.add(book);
	// 	}
	//
	// 	return matchingBooks;
	// }


}
