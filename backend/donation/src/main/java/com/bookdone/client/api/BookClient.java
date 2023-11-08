package com.bookdone.client.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(name = "book-service")
public interface BookClient {
    @GetMapping("/api/books/detail/{isbn}")
    ResponseEntity<?> getBookInfo(@PathVariable String isbn);

    @GetMapping("/api/books/details")
    ResponseEntity<?> getBookInfoList(@RequestParam List<String> isbns);
}
