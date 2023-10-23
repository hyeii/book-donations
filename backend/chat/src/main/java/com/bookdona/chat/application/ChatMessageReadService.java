package com.bookdona.chat.application;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bookdona.chat.application.port.dto.ChatMessageResponseDto;
import com.bookdona.chat.application.port.in.ChatMessageReadUseCase;

@Service
public class ChatMessageReadService implements ChatMessageReadUseCase {

	@Override
	public List<ChatMessageResponseDto> findChatMessageList(Integer memberId) {
		return null;
	}
}
