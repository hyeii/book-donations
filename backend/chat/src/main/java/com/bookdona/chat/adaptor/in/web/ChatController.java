package com.bookdona.chat.adaptor.in.web;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookdona.chat.adaptor.in.web.request.ChatMessageWriteDto;
import com.bookdona.chat.adaptor.in.web.request.ChatRoomCreateDto;
import com.bookdona.chat.adaptor.in.web.response.BaseResponse;
import com.bookdona.chat.application.port.dto.ChatInfoResponseDto;
import com.bookdona.chat.application.port.dto.ChatMessageResponseDto;
import com.bookdona.chat.application.port.dto.ChatRoomResponseDto;
import com.bookdona.chat.application.port.in.ChatMessageReadUseCase;
import com.bookdona.chat.application.port.in.ChatMessageWriteUseCase;
import com.bookdona.chat.application.port.in.ChatRoomReadUseCase;
import com.bookdona.chat.application.port.in.ChatRoomWriteUseCase;

import lombok.RequiredArgsConstructor;

;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api/chats")
public class ChatController {

	private final ChatMessageReadUseCase chatMessageReadUseCase;
	private final ChatMessageWriteUseCase chatMessageWriteUseCase;
	private final ChatRoomReadUseCase chatRoomReadUseCase;
	private final ChatRoomWriteUseCase chatRoomWriteUseCase;

	@GetMapping("/members/{memberId}")
	public ResponseEntity<?> chatRoomList(@PathVariable Integer memberId) {
		List<ChatRoomResponseDto> chatRoomList = chatRoomReadUseCase.findChatRoom(memberId);
		return BaseResponse.okWithData(HttpStatus.OK, "채팅방 조회에 성공했습니다.", chatRoomList);
	}

	@GetMapping("/{chatRoomId}/messages")
	public ResponseEntity<?> chatMessageList(@PathVariable Integer chatRoomId) {
		List<ChatMessageResponseDto> chatMessageList = chatMessageReadUseCase.findChatMessageList(chatRoomId);
		return BaseResponse.okWithData(HttpStatus.OK, "채팅 내역 조회에 성공했습니다.", chatMessageList);
	}

	@GetMapping("/{chatRoomId}/info")
	public ResponseEntity<?> chatRoomInfo(@PathVariable Integer chatRoomId) {
		ChatInfoResponseDto chatRoomInfo = chatRoomReadUseCase.findChatRoomInfo(chatRoomId);
		return BaseResponse.okWithData(HttpStatus.OK, "채팅방 정보 조회에 성공했습니다.", chatRoomInfo);
	}

	@PostMapping
	public ResponseEntity<?> chatRoomCreate(@RequestBody ChatRoomCreateDto chatRoomCreateDto) {
		Integer chatRoomId = chatRoomWriteUseCase.addChatRoom(chatRoomCreateDto.toAddChatRoomCommand());
		return BaseResponse.okWithData(HttpStatus.OK, "채팅방이 생성되었습니다.", chatRoomId);
	}

	@PostMapping("{chatRoomId}")
	public ResponseEntity<?> chatMessageWrite(@PathVariable Integer chatRoomId,
		@RequestBody ChatMessageWriteDto chatMessageWriteDto) {
		Boolean success = chatMessageWriteUseCase.addChatMessage(chatMessageWriteDto.toAddChatMessageCommand());
		if (success) {
			return BaseResponse.ok(HttpStatus.OK, "채팅이 전송되었습니다.");
		} else {
			return BaseResponse.fail("채팅이 정상적으로 전송되지 않았습니다.", 0);
		}
	}

	@PatchMapping("{chatRoomId}/members/{memberId}")
	public ResponseEntity<?> chatRoomExit(@PathVariable Integer chatRoomId, @PathVariable Integer memberId) {
		Boolean success = chatRoomWriteUseCase.exitChatRoom(chatRoomId, memberId);
		if (success) {
			return BaseResponse.ok(HttpStatus.OK, "채팅방에서 퇴장하였습니다.");
		} else {
			return BaseResponse.fail("채팅방에서 정상적으로 퇴장되지 않았습니다.", 0);
		}
	}

}
