package com.bookdone.book.global.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import com.bookdone.book.entity.RedisBook;

@Configuration
public class RedisConfig {
	@Bean
	public LettuceConnectionFactory lettuceConnectionFactory() {
		RedisStandaloneConfiguration config = new RedisStandaloneConfiguration();
		config.setHostName("localhost"); // Redis 서버 주소
		config.setPort(6379); // Redis 서버 포트
		return new LettuceConnectionFactory(config);
	}

	@Bean
	public RedisTemplate<String, RedisBook> redisTemplate() {
		RedisTemplate<String, RedisBook> template = new RedisTemplate<>();
		template.setConnectionFactory(lettuceConnectionFactory());
		template.setKeySerializer(new StringRedisSerializer()); // 키는 문자열로 직렬화
		template.setValueSerializer(new GenericJackson2JsonRedisSerializer()); // 값은 JSON으로 직렬화
		return template;
	}
}
