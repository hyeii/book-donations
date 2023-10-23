package com.bookdona.chat.domain;

import java.time.LocalDateTime;

public class ChatMessage {

	Integer chatMessageId;
	Integer chatRoomId;
	Integer senderId;
	Integer receiverId;
	String content;
	LocalDateTime createdAt;

}
