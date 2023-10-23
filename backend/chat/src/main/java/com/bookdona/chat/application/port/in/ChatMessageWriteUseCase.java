package com.bookdona.chat.application.port.in;

import com.bookdona.chat.application.port.in.command.AddChatMessageCommand;

public interface ChatMessageWriteUseCase {

	public Boolean addChatMessage(AddChatMessageCommand addChatMessageCommand);

}
