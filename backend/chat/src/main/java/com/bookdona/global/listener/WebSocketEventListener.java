package com.bookdona.global.listener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionConnectedEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

@Component
public class WebSocketEventListener {

	@Autowired
	private KafkaTemplate<String, String> kafkaTemplate;

	@EventListener
	public void handleWebSocketConnectListener(SessionConnectedEvent event) {
		// WebSocket 연결 시 작업
	}

	@EventListener
	public void handleWebSocketDisconnectListener(SessionDisconnectEvent event) {
		// WebSocket 연결 끊김 시 작업
	}

	public void sendMessageToKafka(String userId, String message) {
		// userId를 키로 사용하여 메시지를 Kafka의 특정 파티션으로 보냄
		kafkaTemplate.send("topicName", userId, message);
	}
}
