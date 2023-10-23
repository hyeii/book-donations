package com.bookdone.book.global.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import com.bookdone.book.entity.RedisBook;

@Configuration
public class RedisConfig {
	@Bean
	@Primary
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

		Jackson2JsonRedisSerializer<RedisBook> serializer = new Jackson2JsonRedisSerializer<>(RedisBook.class);
		template.setValueSerializer(serializer);
		template.setHashValueSerializer(serializer);

		return template;
	}

	// @Bean
	// public RedisTemplate<String, RedisBook> redisTemplate(RedisConnectionFactory connectionFactory) {
	// 	RedisTemplate<String, RedisBook> template = new RedisTemplate<>();
	// 	template.setConnectionFactory(connectionFactory);
	//
	// 	// Key Serializer 설정 (StringRedisSerializer)
	// 	template.setKeySerializer(new StringRedisSerializer());
	//
	// 	// Value Serializer 설정 (Jackson2JsonRedisSerializer)
	// 	Jackson2JsonRedisSerializer<RedisBook> serializer = new Jackson2JsonRedisSerializer<>(RedisBook.class);
	// 	template.setValueSerializer(serializer);
	//
	// 	// Hash Key Serializer 설정 (StringRedisSerializer)
	// 	template.setHashKeySerializer(new StringRedisSerializer());
	//
	// 	// Hash Value Serializer 설정 (Jackson2JsonRedisSerializer)
	// 	template.setHashValueSerializer(serializer);
	//
	// 	return template;
	// }
}

