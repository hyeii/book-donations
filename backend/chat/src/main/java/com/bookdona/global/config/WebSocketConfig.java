package com.bookdona.global.config;

import java.security.Principal;
import java.util.Map;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;
import org.springframework.web.socket.server.HandshakeInterceptor;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;

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
		config.setApplicationDestinationPrefixes("/app");
		/*
			"/sub" 로 구독
			서버가 메시지를 수신, 클라이언트에서 "/app" 으로 send
		 */

		// heart beat 설정
		config.enableSimpleBroker("/sub")
			.setHeartbeatValue(new long[] {20000, 20000}).setTaskScheduler(taskScheduler()); // 서버 -> 클라이언트, 클라이언트 -> 서버 하트비트 시간 설정 20초
	}


	@Bean
	public TaskScheduler taskScheduler() {
		ThreadPoolTaskScheduler scheduler = new ThreadPoolTaskScheduler();
		scheduler.setPoolSize(1);
		scheduler.setThreadNamePrefix("websocket-heartbeat-task-");
		scheduler.initialize();
		return scheduler;
	}

	// 세션 유지 시간 3시간
	@Bean
	public ServletServerContainerFactoryBean createWebSocketContainer() {
		var container = new ServletServerContainerFactoryBean();
		container.setMaxSessionIdleTimeout(10800000L);
		return container;
	}

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		// STOMP 연결 엔드포인트
		registry.addEndpoint("/ws")
			.withSockJS()
			.setInterceptors(new HandshakeInterceptor() {
				@Override
				public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
					WebSocketHandler wsHandler, Map<String, Object> attributes) {
					// 쿼리 파라미터에서 usernickname 추출
					String userNickname = request.getURI().getQuery().split("=")[1];
					if (userNickname == null || userNickname.isEmpty())
						return false;

					log.info("웹 소켓 세션이 사용자 닉네임을 인식함: {}", userNickname);
					if (redisTemplate.opsForValue().get("member:" + userNickname).equals("online")) {
						log.info("ws 이미 연결된 유저");
						return false;

					} else {
						redisTemplate.opsForValue().set("member:" + userNickname, "online");
						// ws header 에 userNickname 저장
						attributes.put("usernickname", userNickname);
						log.info("ws 새로 연결한 유저");
						return true;
					}
				}

				@Override
				public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response,
					WebSocketHandler wsHandler, Exception exception) {
					// 핸드셰이크 후 처리
					if (exception != null) {
						log.info("웹소켓 핸드셰이크 중 예외 발생!", exception);
					} else {
						log.info("웹소켓 핸드셰이크 성공!");
					}
				}
			});
	}
}