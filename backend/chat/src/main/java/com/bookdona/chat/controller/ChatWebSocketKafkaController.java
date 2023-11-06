// package com.bookdona.chat.controller;
//
// import org.springframework.data.redis.core.RedisTemplate;
// import org.springframework.kafka.annotation.KafkaListener;
// import org.springframework.kafka.core.KafkaTemplate;
// import org.springframework.messaging.handler.annotation.DestinationVariable;
// import org.springframework.messaging.handler.annotation.MessageMapping;
// import org.springframework.messaging.handler.annotation.Payload;
// import org.springframework.messaging.simp.SimpMessagingTemplate;
// import org.springframework.web.bind.annotation.RestController;
//
// import com.bookdona.chat.dto.request.ChatMessageWriteRequest;
// import com.bookdona.chat.service.ChatService;
//
// import lombok.RequiredArgsConstructor;
// import lombok.extern.slf4j.Slf4j;
//
// @RestController
// @RequiredArgsConstructor
// @Slf4j
// public class ChatWebSocketKafkaController {
//
// 	private final SimpMessagingTemplate messagingTemplate;
// 	private final KafkaTemplate<String, String> kafkaTemplate;
// 	private final RedisTemplate<String, String> redisTemplate;
//
// 	private final ChatService chatService;
//
// 	// TODO: 해당 채팅방 참여 인원 모두에게 callback
// 	// 클라이언트에서 /app/chat/{roomId} 서버로 메시지를 전송
// 	@MessageMapping("/chat/{roomId}")
// 	public void sendChat(@DestinationVariable String roomId, @Payload ChatMessageWriteRequest chatMessage) {
// 		log.info("{} 방에 채팅 보내기", roomId);
// 		messagingTemplate.convertAndSend("/sub/chat/" + roomId, chatMessage);
// 		// 구독한 클라이언트들에게 /sub/chat/{roomId} 로 pub
//
// 	}
//
// 	// Kafka Listener 설정을 추가합니다.
// 	@KafkaListener(topics = "chat", groupId = "chat-group")
// 	public void listenGroupChat(String message) {
// 		log.info("Kafka Message: {}", message);
//
// 		// receiver 유저가 로그인 상태라면
// 		// messagingTemplate.convertAndSend("/sub/chat/" + roomId, chatMessage);
//
// 	}
// }
//
// /*
//  - 각 서버
// 	[유저 유무]
// 		유저 입장
// 			redis 에 세션정보를 저장한다.
// 		유저 퇴장
// 			redis 에서 유저 세션을 삭제한다.
// 		하트비트
// 			일정 시간동안 redis 완탐, 유저가 클라이언트에서도 로그인 유지중인지 확인한다.
//
// 	[메시지 송신]
// 		웹소켓을 통해 메시지를 받으면, 메시지를 카프카로 전송한다.
//
// 	[메시지 수신]
// 		카프카에서 메시지를 가져온다. (어떤 서버가 갖고 올지는 모름, 그냥 로드밸런싱)
// 			redis 에서 유저 유무를 확인한다.
// 				유저가 있다면, sender, reciever 클라이언트에게 pub 한다.
// 				유저가 없다면, 해당 채팅방 message - mongodb에 저장한다.
//
//  */
