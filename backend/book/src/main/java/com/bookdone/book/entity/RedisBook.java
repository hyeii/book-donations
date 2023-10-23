package com.bookdone.book.entity;

import org.springframework.data.redis.core.RedisHash;

import lombok.Getter;
import lombok.ToString;

@RedisHash("books")
@Getter
@ToString
public class RedisBook {
	String id;
	String title;
	String isbn;
}
