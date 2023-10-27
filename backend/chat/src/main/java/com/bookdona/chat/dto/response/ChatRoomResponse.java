package com.bookdona.chat.dto.response;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatRoomResponse {

	private String chatRoomId;
	private String bookImage;
	private String bookTitle;
	private String opponentNickname;
	private String lastMessage;
	private LocalDateTime lastMessageTime;
	private Boolean isDonor;

}
