package com.bookdone.book.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.stereotype.Service;

import com.bookdone.book.dto.ReviewRequestDto;
import com.bookdone.book.dto.ReviewResponseDto;
import com.bookdone.book.entity.Book;
import com.bookdone.book.entity.Review;
import com.bookdone.book.repository.BookRepository;
import com.bookdone.book.repository.ReviewRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReviewService {
	private final BookRepository bookRepository;
	private final ReviewRepository reviewRepository;

	public List<ReviewResponseDto> getReviews(String isbn) {
		Book book = bookRepository.findByIsbn(isbn).orElseThrow(IllegalArgumentException::new);
		return reviewRepository.findByBook(book)
			.stream()
			.map(Review::toReviewResponseDto)
			.collect(Collectors.toList());
	}

	public void postReview(ReviewRequestDto reviewDto, String memberNickname) {
		Book book = bookRepository.findByIsbn(reviewDto.getIsbn()).orElseThrow(IllegalArgumentException::new);
		if(!reviewDto.getWriter().equals(memberNickname)) {
			throw new IllegalArgumentException("댓글 작성자와 로그인 유저의 닉네임이 다릅니다.");
		}
		Review review = Review.builder()
			.review(reviewDto.getReview())
			.writer(reviewDto.getWriter())
			.book(book)
			.build();
		reviewRepository.save(review);
	}

	public void deleteReview(long reviewId, String memberNickname) {
		Review review = reviewRepository.findById(reviewId).orElseThrow(IllegalArgumentException::new);
		if(!review.getWriter().equals(memberNickname)) {
			throw new IllegalArgumentException("작성자가 아닙니다");
		}
		reviewRepository.deleteById(reviewId);
	}
}
