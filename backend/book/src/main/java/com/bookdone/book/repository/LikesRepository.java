package com.bookdone.book.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookdone.book.entity.Book;
import com.bookdone.book.entity.Likes;

public interface LikesRepository extends JpaRepository<Likes, Long> {
	List<Likes> findByMemberId(Long memberId);
	Optional<Likes> findByMemberIdAndBookAndLocalCode(long memberId, Book isbn, String localCode);
	Optional<Likes> findByMemberIdAndBook(long memberId, Book isbn);

	List<Likes> findAllByBookId(Long bookId);
}
