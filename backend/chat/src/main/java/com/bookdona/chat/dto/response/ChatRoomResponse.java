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

	private long tradeId;
	private String opponentNickname;
	private String lastMessage;
	private LocalDateTime lastMessageTime;
}
