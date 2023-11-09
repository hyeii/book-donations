package com.bookdona.global.config;

import java.util.Map;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.server.HandshakeInterceptor;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Configuration
@RequiredArgsConstructor
@EnableWebSocketMessageBroker
@Slf4j
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	private final RedisTemplate<String, String> redisTemplate;

	@Override
	public void configureMessageBroker(MessageBrokerRegistry config) {
		config.enableSimpleBroker("/sub");
		config.setApplicationDestinationPrefixes("/app");
		/*
			"/sub" 로 구독
			서버가 메시지를 수신, 클라이언트에서 "/app" 으로 send
		 */
	}

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		// STOMP 연결 엔드포인트
		registry.addEndpoint("/ws")
			.withSockJS()
			.setInterceptors(new HandshakeInterceptor() {
				@Override
				public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
					WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
					String memberId = request.getHeaders().getFirst("member-id");
					if (memberId != null) {
						log.info("웹 소켓 세션이 사용자를 인식함: {}", memberId);
						redisTemplate.opsForValue().set("member:" + memberId, "online"); // redis 에 유저 정보 저장
						attributes.put("member-id", memberId);
					}
					return true;
				}

				@Override
				public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response,
					WebSocketHandler wsHandler, Exception exception) {
					if (exception != null) {
						log.info("웹소켓 핸드셰이크 중 예외 발생!", exception);
					} else {
						log.info("웹소켓 핸드셰이크 성공!");
					}
				}
			});
	}
}