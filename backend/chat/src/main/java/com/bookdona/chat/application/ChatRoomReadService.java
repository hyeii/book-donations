package com.bookdona.chat.application;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bookdona.chat.application.port.dto.ChatInfoResponseDto;
import com.bookdona.chat.application.port.dto.ChatRoomResponseDto;
import com.bookdona.chat.application.port.in.ChatRoomReadUseCase;

@Service
public class ChatRoomReadService implements ChatRoomReadUseCase {

	@Override
	public List<ChatRoomResponseDto> findChatRoom(Integer memberId) {
		return null;
	}

	@Override
	public ChatInfoResponseDto findChatRoomInfo(Integer chatRoomId) {
		return null;
	}
}
