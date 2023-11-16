package com.bookdone.client.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(name = "book-service")
public interface BookClient {
    @GetMapping("/api/books/detail/{isbn}")
    ResponseEntity<?> getBookInfo(@RequestHeader("member-id") Long memberId, @PathVariable String isbn);

    @GetMapping("/api/books/likes/{isbn}")
    ResponseEntity<?> getBookLikesList(@PathVariable String isbn);

    @GetMapping("/api/books/details")
    ResponseEntity<?> getBookInfoList(@RequestHeader("member-id") Long memberId, @RequestParam List<String> isbns);
}
