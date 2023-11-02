package com.bookdone.book.repository;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.data.elasticsearch.repository.config.EnableReactiveElasticsearchRepositories;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

import com.bookdone.book.document.Book;

public interface ElasticSearchRepository extends ElasticsearchRepository<Book, Long> {

	// title 필드를 기반으로 검색하는 쿼리 메소드
	List<Book> findByTitleContaining(String title);

	// 엘라스틱서치를 사용하고자 한다면 아래와 같이 @Query를 사용할 수 있습니다.
	// 하지만 이는 JPQL이 아니라 엘라스틱서치에 특화된 쿼리가 필요합니다.
	// 엘라스틱서치 사용을 위한 쿼리 메소드 예시입니다. (실제로는 이렇게 작동하지 않습니다)
	// @Query("YOUR_ELASTICSEARCH_QUERY_HERE")
	// List<Book> searchByTitleUsingElasticsearch(String title);
}
