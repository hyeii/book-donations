package com.bookdona.chat.application;

import org.springframework.stereotype.Service;

import com.bookdona.chat.application.port.in.ChatMessageWriteUseCase;
import com.bookdona.chat.application.port.in.command.AddChatMessageCommand;

@Service
public class ChatMessageWriteService implements ChatMessageWriteUseCase {

	@Override
	public Boolean addChatMessage(AddChatMessageCommand addChatMessageCommand) {
		return false;
	}
}
