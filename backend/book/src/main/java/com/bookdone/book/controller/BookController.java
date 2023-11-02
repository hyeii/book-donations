package com.bookdone.book.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bookdone.book.dto.BookAutoCompDto;
import com.bookdone.book.dto.BookDto;
import com.bookdone.book.dto.BookTitleUrlDto;
import com.bookdone.book.dto.LikesRequestDto;
import com.bookdone.book.dto.LikesResponseDto;
import com.bookdone.book.service.ElasticSearchService;
import com.bookdone.book.service.LikesService;
import com.bookdone.client.dto.MemberResponse;
import com.bookdone.book.dto.ReviewRequestDto;
import com.bookdone.book.dto.ReviewResponseDto;
import com.bookdone.book.service.BookService;
import com.bookdone.book.service.ReviewService;
import com.bookdone.global.response.BaseResponse;
import com.bookdone.client.api.MemberClient;
import com.bookdone.util.ResponseUtil;
import com.fasterxml.jackson.core.JsonProcessingException;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/books")
public class BookController {

	private final ReviewService reviewService;
	private final BookService bookService;
	private final LikesService likesService;
	private final MemberClient memberClient;
	private final ResponseUtil responseUtil;
	private final ElasticSearchService elasticSearchService;

	// TODO : 책 제목 자동완성 리스트 반환 // redis 데이터 넣어줘야함
	@GetMapping("/auto-completion/{title}")
	public ResponseEntity<?> autoCompletionBookList(@PathVariable String title) throws IOException {
		List<BookAutoCompDto> bookAutoCompDto = elasticSearchService.autoCompletion(title);
		return BaseResponse.okWithData(HttpStatus.OK, "책 제목 자동완성", bookAutoCompDto);
	}

	// TODO : 엔터 쳤을 때 이동하는 곳
	@GetMapping("/search/{title}")
	public ResponseEntity<?> searchBookList(@PathVariable String title) throws IOException {
		List<BookDto> books = elasticSearchService.searchBooks(title);
		// List<BookDto> books = elasticSearchService.searchBookList(title);
		return BaseResponse.okWithData(HttpStatus.OK, "책 리스트 조회 완료", books);
	}

	/* TODO : 책 세부 디테일
			  자동완성 클릭하면 이곳을 사용 or 책 리스트에서 클릭하면 이곳으로 옴
			  */
	@GetMapping("/detail/{isbn}")
	public ResponseEntity<?> getBookDetail(@PathVariable String isbn) {
		BookDto book = bookService.getBookDetail(isbn);
		return BaseResponse.okWithData(HttpStatus.OK, "책 상세 조회 완료", book);
	}

	@GetMapping("/details")
	public ResponseEntity<?> getBooksDetail(@RequestBody List<String> isbns) {
		List<BookDto> books = bookService.getBooksDetail(isbns);
		return BaseResponse.okWithData(HttpStatus.OK, "여러 책 상세 조회 완료", books);
	}

	// TODO : 책에 대한 리뷰 조회
	@GetMapping("/reviews/{isbn}")
	public ResponseEntity<?> getReviews(@PathVariable String isbn) {
		List<ReviewResponseDto> reviews = reviewService.getReviews(isbn);
		return BaseResponse.okWithData(HttpStatus.OK, "책에 대한 리뷰 조회", reviews);
	}

	// TODO : 책에 대한 리뷰 작성
	@PostMapping("/reviews")
	public ResponseEntity<?> postReview(@RequestBody ReviewRequestDto reviewDto,
		@RequestHeader("member-id") long memberId) throws JsonProcessingException {
		ResponseEntity<?> response = memberClient.getMemberInfo(memberId);
		reviewService.postReview(reviewDto,
			responseUtil.extractDataFromResponse(response, MemberResponse.class).getNickname());
		return BaseResponse.ok(HttpStatus.OK, "책에 대한 리뷰 작성");
	}

	// TODO : 책에 대한 리뷰 삭제
	@DeleteMapping("/reviews/{reviewId}")
	public ResponseEntity<?> postReview(@PathVariable long reviewId,
		@RequestHeader("member-id") long memberId) throws JsonProcessingException {
		ResponseEntity<?> response = memberClient.getMemberInfo(memberId);
		reviewService.deleteReview(reviewId,
			responseUtil.extractDataFromResponse(response, MemberResponse.class).getNickname());
		return BaseResponse.ok(HttpStatus.OK, "책에 대한 리뷰 삭제");
	}

	/*
	 TODO: 특정 지역 특정 책에 대한 나의 관심도서 여부 조회
	 		개수는 여기서 작업할 내용이 아님, 
	 		article 에 요청해서 조회해야 정확한 데이터 count
	*/
	@GetMapping("/likes")
	public ResponseEntity<?> getLikesBooks(@RequestHeader("member-id") long memberId) {
		List<LikesResponseDto> likesBooks = likesService.getLikesBooks(memberId);
		return BaseResponse.okWithData(HttpStatus.OK, "관심도서 책 조회 완료", likesBooks);
	}

	// TODO: 특정 지역 특정 책에 대한 등록, 취소 토글
	@PostMapping("/likes")
	public ResponseEntity<?> toggleLikesBook(@RequestHeader("member-id") long memberId,
		@RequestBody LikesRequestDto likesRequestDto) {
		boolean isToggled = likesService.toggleLikesBook(memberId, likesRequestDto);
		String message = isToggled ? "관심도서 등록 완료" : "관심도서 등록 취소";
		return BaseResponse.ok(HttpStatus.OK, message);
	}

	@PostMapping("/title-image")
	public ResponseEntity<?> addTitleImage(@RequestBody List<BookTitleUrlDto> bookTitleUrlDtoList) {
		bookService.addTitleImage(bookTitleUrlDtoList);
		return BaseResponse.ok(HttpStatus.OK, "title-url 등록 완료");
	}
}
