package com.bookdona.chat.application.port.in;

import java.util.List;

import com.bookdona.chat.application.port.dto.ChatMessageResponseDto;

public interface ChatMessageReadUseCase {

	List<ChatMessageResponseDto> findChatMessageList(Integer memberId);

}
