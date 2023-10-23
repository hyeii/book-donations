package com.bookdone.book.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookdone.book.entity.Book;

public interface BookRepository extends JpaRepository<Book, Long> {
	Optional<Book> findByIsbn(String isbn);

	List<Book> findByTitle(String title);
}
