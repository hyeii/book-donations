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

	public void postReview(ReviewRequestDto reviewDto) {
		Book book = bookRepository.findByIsbn(reviewDto.getIsbn()).orElseThrow(IllegalArgumentException::new);
		Review review = Review.builder()
			.review(reviewDto.getReview())
			.writer(reviewDto.getWriter())
			.book(book)
			.build();
		reviewRepository.save(review);
	}

	public void deleteReview(long id) {
		Review review = reviewRepository.findById(id).orElseThrow(IllegalArgumentException::new);
		reviewRepository.deleteById(id);
	}
}
