package com.bookdona.chat.dto.request;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatRoomCreateRequest {

	@NotNull
	private Long donationId;

	@Null
	@Setter
	private Long memberId;

}
