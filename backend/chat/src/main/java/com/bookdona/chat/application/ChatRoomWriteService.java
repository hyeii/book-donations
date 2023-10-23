package com.bookdona.chat.application;

import org.springframework.stereotype.Service;

import com.bookdona.chat.application.port.in.ChatRoomWriteUseCase;
import com.bookdona.chat.application.port.in.command.AddChatRoomCommand;

@Service
public class ChatRoomWriteService implements ChatRoomWriteUseCase {

	@Override
	public Integer addChatRoom(AddChatRoomCommand addChatRoomCommand) {
		return null;
	}

	@Override
	public Boolean exitChatRoom(Integer chatRoomId, Integer memberId) {
		return null;
	}
}
