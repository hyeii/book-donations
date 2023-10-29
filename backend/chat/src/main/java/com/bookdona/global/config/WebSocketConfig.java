package com.bookdona.global.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

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
		registry.addEndpoint("/ws").withSockJS();
	}
}