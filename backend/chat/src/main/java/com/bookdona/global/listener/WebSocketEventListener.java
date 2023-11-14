package com.bookdona.global.listener;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.GenericMessage;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionConnectedEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
@RequiredArgsConstructor
public class WebSocketEventListener  {

	//private final KafkaTemplate<String, String> kafkaTemplate;
	private final RedisTemplate<String, String> redisTemplate;

	@EventListener
	public void handleWebSocketConnectListener(SessionConnectedEvent event) {
		// WebSocket 연결 시 작업
		// String userNickname = "";
		// GenericMessage<?> connectMessage = (GenericMessage<?>)event.getMessage().getHeaders().get("simpConnectMessage");
		// Map<String, Object> sessionAttributes = (Map<String, Object>)connectMessage.getHeaders()
		// 	.get("simpSessionAttributes");
		// if (sessionAttributes != null) {
		// 	userNickname = (String)sessionAttributes.get("usernickname");
		// 	log.info("User Nickname: {}", userNickname);
		// }
		// redisTemplate.opsForValue().set("member:" + userNickname, "online");
	}

	// TODO: 일정 시간 동안 heartbeat 가 수신되지 않으면 끊어진 것으로 간주
	// TODO: 즉시 동작 아님, 일정 시간(heart beat) 지나야 동작
	@EventListener
	public void handleWebSocketDisconnectListener(SessionDisconnectEvent event) {
		// WebSocket 연결 끊김 시 작업
		log.info("session disconnect event");
		StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());
		String userNickname = (String) headerAccessor.getSessionAttributes().get("usernickname");

		if (userNickname != null) {
			log.info("remove User Nickname: {}", userNickname);
			// redisTemplate.opsForValue().set("member:" + userNickname, "offline");
			redisTemplate.delete("member:" + userNickname);
		} else {
			log.info("user 가 이미 연결을 종료함.");
		}
	}
}
