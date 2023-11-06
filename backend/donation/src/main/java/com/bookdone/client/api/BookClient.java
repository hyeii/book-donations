package com.bookdone.client.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@FeignClient(name = "book-service")
public interface BookClient {
    @GetMapping("/isbn/{isbn}")
    ResponseEntity<?> getBookInfo(@PathVariable Long isbn);

    @GetMapping
    ResponseEntity<?> getBookInfoList(List<Long> isbnList);
}
