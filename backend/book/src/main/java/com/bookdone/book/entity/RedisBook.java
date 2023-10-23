package com.bookdone.book.entity;

import org.springframework.data.redis.core.RedisHash;
import org.springframework.data.redis.core.index.Indexed;
import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@RedisHash("book")
@Getter
@Setter
@ToString
public class RedisBook {
	String id;
	@Indexed
	String title;
	@Indexed
	String isbn;
}
