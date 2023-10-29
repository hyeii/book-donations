package com.bookdona.chat.controller;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RestController;

import com.bookdona.chat.dto.request.ChatMessageWriteRequest;
import com.bookdona.chat.service.ChatService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
public class ChatWebSocketController {

	private final SimpMessagingTemplate messagingTemplate;
	private final ChatService chatService;

	// TODO: 해당 채팅방 참여 인원 모두에게 callback
	// 클라이언트에서 /app/chat/{roomId} 서버로 메시지를 전송
	@MessageMapping("/chat/{roomId}")
	public void sendChat(@DestinationVariable String roomId, @Payload ChatMessageWriteRequest chatMessage) {
		log.info("{} 방에 채팅 보내기", roomId);
		messagingTemplate.convertAndSend("/sub/chat/" + roomId, chatMessage);
		// 구독한 클라이언트들에게 /sub/chat/{roomId} 로 pub

	}

}
