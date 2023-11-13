package com.bookdona.chat.dto.response;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class ChatRoomResponse {

	private long tradeId;
	private String userNickname;
	private String lastMessage;
	private LocalDateTime lastMessageTime;
}
