package com.bookdona.chat.dto.request;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

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
public class ChatMessageWriteRequest {

	@NotBlank
	private String message;
	private Long tradeId;
	private String senderNickname;
}
