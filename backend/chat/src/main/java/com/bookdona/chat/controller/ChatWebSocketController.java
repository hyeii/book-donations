package com.bookdona.chat.controller;

import org.bson.types.ObjectId;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RestController;

import com.bookdona.chat.document.ChatMessage;
import com.bookdona.chat.dto.request.ChatMessageWriteRequest;
import com.bookdona.chat.dto.response.ChatMessageResponse;
import com.bookdona.chat.service.ChatService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
public class ChatWebSocketController {

	private final SimpMessagingTemplate messagingTemplate;
	private final RedisTemplate<String, String> redisTemplate; // 온라인 유저 확인 용도
	private final ChatService chatService;

	// 클라이언트에서 /app/chat/{tradeId} 서버로 메시지를 전송
	// TODO: 해당 채팅방 참여 인원 모두에게 callback
	// TODO: tradeId 를 기준으로 채팅방 Id를 동기화 할거임
	@MessageMapping("/chat/{tradeId}")
	public void sendChat(@DestinationVariable Long tradeId,
		@Payload ChatMessageWriteRequest chatMessageWriteRequest) {
		log.info("{} 방에 채팅 보내기 {}", tradeId, chatMessageWriteRequest);
		// 채팅 방에 채팅 추가
		ChatMessageResponse chatMessageResponse = chatService
			.addChatMessage(tradeId, chatMessageWriteRequest);

		// message
		messagingTemplate.convertAndSend("/sub/chat/" + tradeId, chatMessageResponse);

		// 알림
		// 온라인 상태 확인
		String onlineStatus = redisTemplate.opsForValue()
			.get("member:" + chatMessageWriteRequest.getSenderNickname());

		if ("online".equals(onlineStatus)) {
			// 온라인일 경우 pub, sender receiver 둘다에게 보냄
		} else {

		}

		// 채팅 방의 마지막 채팅 변경
		// chatService.addChatMessage(tradeId, chatMessageWriteRequest);
	}
}
