package com.bookdone.book.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import com.bookdone.book.dto.ReviewResponseDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Review {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	@ManyToOne(fetch = FetchType.LAZY)
	Book book;
	String writer;
	String review;
	@Column(name = "created_at")
	@CreationTimestamp
	LocalDateTime createdAt;

	public static ReviewResponseDto toReviewResponseDto(Review review){
		return new ReviewResponseDto(
			review.getWriter(),
			review.getReview(),
			review.getCreatedAt());
	}
}
