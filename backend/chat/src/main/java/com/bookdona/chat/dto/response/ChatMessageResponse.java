package com.bookdona.chat.dto.response;

import java.time.LocalDateTime;

import com.bookdona.chat.dto.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatMessageResponse {

	Long tradeId;
	String senderNickname;
	String message;
	LocalDateTime createdAt;
}
