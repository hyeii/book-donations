package com.bookdone.book.repository;

import org.springframework.data.elasticsearch.annotations.Query;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.data.elasticsearch.repository.config.EnableReactiveElasticsearchRepositories;

import java.util.List;

import com.bookdone.book.document.Book;

public interface ElasticSearchRepository extends ElasticsearchRepository<Book, Long> {

	// title 필드를 기반으로 검색하는 쿼리 메소드
	List<Book> findByTitleContaining(String title);

	@Query("{\"match\": {\"title\": {\"query\": \"?0\"}}}")
	List<Book> searchByTitle(String title);
}
