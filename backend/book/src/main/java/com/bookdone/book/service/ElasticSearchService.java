package com.bookdone.book.service;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.unit.Fuzziness;
import org.elasticsearch.index.query.Operator;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.sort.SortBuilders;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.stereotype.Service;

import org.elasticsearch.search.SearchHit;

import com.bookdone.book.dto.BookAutoCompDto;
import com.bookdone.book.dto.BookDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ElasticSearchService {

	private final RestHighLevelClient client;

	// 엔터 이후 책 리스트
	public List<BookDto> searchBooks(String title) throws IOException {
		SearchResponse searchResponse = performSearch(title, 100);

		return Arrays.stream(searchResponse.getHits().getHits())
			.map(SearchHit::getSourceAsMap)
			.map(this::convertToBookDto)
			.collect(Collectors.toList());
	}

	// 자동완성
	public List<BookAutoCompDto> autoCompletion(String title) throws IOException {
		SearchResponse searchResponse = performSearch(title, 5);

		return Arrays.stream(searchResponse.getHits().getHits())
			.map(SearchHit::getSourceAsMap)
			.map(this::convertToBookAutoCompDto)
			.collect(Collectors.toList());
	}

	/*
		text field - 정렬이 안된다. / 부분 검색 가능
		keyword field - 정렬이 된다. / 부분 검색 불가능

		결합쿼리 - text field 로 부분검색, keyword field 로 정렬
	 */
	private SearchResponse performSearch(String title, int size) throws IOException {
		SearchRequest searchRequest = new SearchRequest("books"); // 인덱스 이름
		SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();

		searchSourceBuilder.query(
			QueryBuilders.boolQuery()
				.should(QueryBuilders.prefixQuery("TITLE.keyword", title).boost(5)) // 5점을 줘서 정렬 순위를 높임
				.should(QueryBuilders.matchQuery("TITLE", title).operator(Operator.AND).fuzziness(Fuzziness.ONE))
		);

		searchSourceBuilder.size(size); // 반환 사이즈
		searchSourceBuilder.sort(SortBuilders.scoreSort().order(SortOrder.DESC)); // boost 점수 _score 로 정렬

		searchRequest.source(searchSourceBuilder);
		return client.search(searchRequest, RequestOptions.DEFAULT);
	}

	private BookAutoCompDto convertToBookAutoCompDto(Map<String, Object> sourceAsMap) {
		return BookAutoCompDto.builder()
			.title((String)sourceAsMap.get("TITLE"))
			.isbn((String)sourceAsMap.get("EA_ISBN"))
			.build();
	}

	private BookDto convertToBookDto(Map<String, Object> sourceAsMap) {
		// 빌더를 사용하여 BookDto 생성
		return BookDto.builder()
			.id(Long.parseLong(sourceAsMap.get("ID").toString()))
			.title((String)sourceAsMap.get("TITLE"))
			.vol((String)sourceAsMap.get("VOL"))
			.seriesTitle((String)sourceAsMap.get("SERIES_TITLE"))
			.seriesNo((String)sourceAsMap.get("SERIES_NO"))
			.author((String)sourceAsMap.get("AUTHOR"))
			.isbn((String)sourceAsMap.get("EA_ISBN"))
			.eaAddCode((String)sourceAsMap.get("EA_ADD_CODE"))
			.setIsbn((String)sourceAsMap.get("SET_ISBN"))
			.setAddCode((String)sourceAsMap.get("SET_ADD_CODE"))
			.publisher((String)sourceAsMap.get("PUBLISHER"))
			.page((String)sourceAsMap.get("PAGE"))
			.bookSize((String)sourceAsMap.get("BOOK_SIZE"))
			.subject((String)sourceAsMap.get("SUBJECT"))
			.titleUrl((String)sourceAsMap.get("TITLE_URL"))
			.publisherUrl((String)sourceAsMap.get("PUBLISHER_URL"))
			.inputDate((String)sourceAsMap.get("INPUT_DATE"))
			.updateDate((String)sourceAsMap.get("UPDATE_DATE"))
			.build();
	}
}
