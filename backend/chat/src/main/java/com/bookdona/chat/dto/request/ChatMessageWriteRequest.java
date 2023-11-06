package com.bookdona.chat.dto.request;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatMessageWriteRequest {

	@NotBlank
	String message;
	String senderNickname;
	String receiverNickname;
	LocalDateTime createdAt;
}
