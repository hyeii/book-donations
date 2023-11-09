package com.bookdona.chat.document;

import java.time.LocalDateTime;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.format.annotation.DateTimeFormat;

import com.bookdona.global.exception.BusinessException;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class ChatRoom {

	@Id
	private ObjectId id;
	private Long tradeId;
	private String user1;
	private String user2;
	private ObjectId lastChatId;
	@CreatedDate
	private LocalDateTime createdAt;
	private Boolean isLive;

	// public Long getOpponent(Long memberId) {
	// 	if (donorId == null)
	// 		throw new BusinessException("채팅 상대방을 찾을 수 없습니다.");
	// 	return memberId.equals(donorId) ? requesterId : donorId;
	// }

	public void kill() {
		this.isLive = false;
	}

	public void updateLastChat(ObjectId lastChatId) {
		this.lastChatId = lastChatId;
	}
}
