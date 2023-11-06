package com.bookdona.chat.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookdona.chat.dto.request.ChatMessageWriteRequest;
import com.bookdona.chat.dto.request.ChatRoomCreateRequest;
import com.bookdona.chat.dto.response.ChatMessageResponse;
import com.bookdona.chat.dto.response.ChatOpponentResponse;
import com.bookdona.chat.dto.response.ChatRoomResponse;
import com.bookdona.chat.service.ChatService;
import com.bookdona.global.response.BaseResponse;
import com.fasterxml.jackson.core.JsonProcessingException;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api/chats")
public class ChatController {

	private final ChatService chatService;

	@PostMapping("")
	public ResponseEntity<?> chatRoomCreate(@RequestBody ChatRoomCreateRequest chatRoomCreateRequest,
		@RequestHeader("member-id") Long memberId) throws JsonProcessingException {
		ChatRoomResponse chatRoomResponse = chatService.addChatRoom(chatRoomCreateRequest);
		return BaseResponse.okWithData(HttpStatus.OK, "채팅방이 생성되었습니다.", chatRoomResponse);
	}

	@PostMapping("/{tradeId}")
	public ResponseEntity<?> chatMessageWrite(@PathVariable Long tradeId,
		@RequestBody ChatMessageWriteRequest chatMessageWriteRequest, @RequestHeader("member-id") Long memberId) {
		chatService.addChatMessage(tradeId, chatMessageWriteRequest);
		return BaseResponse.ok(HttpStatus.OK, "채팅 입력에 성공했습니다.");
	}

	@GetMapping("")
	public ResponseEntity<?> chatRoomList(@RequestHeader("member-id") Long memberId) throws JsonProcessingException {
		List<ChatRoomResponse> chatRoomResponseList = chatService.findChatRoomList(memberId);
		return BaseResponse.okWithData(HttpStatus.OK, "채팅방 목록 조회에 성공했습니다.", chatRoomResponseList);
	}

	@GetMapping("/{tradeId}/messages")
	public ResponseEntity<?> chatMessageList(@PathVariable Long tradeId,
		@RequestHeader("member-id") Long memberId) throws JsonProcessingException {
		List<ChatMessageResponse> chatMessageResponseList = chatService.findChatMessageList(tradeId, memberId);
		return BaseResponse.okWithData(HttpStatus.OK, "채팅 메세지 목록 조회에 성공했습니다.", chatMessageResponseList);
	}

	//
	// @GetMapping("/{tradeId}/opponent")
	// public ResponseEntity<?> chatOpponent(@PathVariable String tradeId,
	// 	@RequestHeader("member-id") Long memberId) throws
	// 	JsonProcessingException {
	// 	ChatOpponentResponse chatOpponentResponse = chatService.findChatOpponent(tradeId, memberId);
	// 	return BaseResponse.okWithData(HttpStatus.OK, "채팅 상대 조회에 성공했습니다.", chatOpponentResponse);
	// }
	//
	// @PatchMapping("/{chatRoomId}")
	// public ResponseEntity<?> chatRoomExit(@PathVariable String chatRoomId, @RequestHeader("member-id") Long memberId) {
	// 	chatService.exitChatRoom(chatRoomId, memberId);
	// 	return BaseResponse.ok(HttpStatus.OK, "채팅방에서 퇴장했습니다.");
	// }

}
