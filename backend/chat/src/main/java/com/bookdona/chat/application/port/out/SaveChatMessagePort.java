package com.bookdona.chat.application.port.out;

import com.bookdona.chat.domain.ChatMessage;

public interface SaveChatMessagePort {

	void save(ChatMessage chatMessage);
}
