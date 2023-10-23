package com.bookdona.chat.application.port.in;

import com.bookdona.chat.application.port.in.command.AddChatRoomCommand;

public interface ChatRoomWriteUseCase {

	Integer addChatRoom(AddChatRoomCommand addChatRoomCommand);

	Boolean exitChatRoom(Integer chatRoomId, Integer memberId);

}
