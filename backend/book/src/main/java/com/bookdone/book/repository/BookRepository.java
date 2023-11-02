package com.bookdone.book.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookdone.book.entity.Book;

public interface BookRepository extends JpaRepository<Book, Long> {
	Optional<Book> findByIsbn(String isbn);

	List<Book> findByTitleContaining(String title);

	@Query("SELECT b FROM Book b WHERE b.isbn IN :isbns")
	List<Book> findByIsbnIn(List<String> isbns);

	@Modifying
	@Query("UPDATE Book b SET b.titleUrl = :titleUrl WHERE b.isbn = :isbn")
	void updateTitleUrlByIsbn(@Param("isbn") String isbn, @Param("titleUrl") String titleUrl);
}
