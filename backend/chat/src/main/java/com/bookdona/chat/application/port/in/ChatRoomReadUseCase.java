package com.bookdona.chat.application.port.in;

import java.util.List;

import com.bookdona.chat.application.port.dto.ChatInfoResponseDto;
import com.bookdona.chat.application.port.dto.ChatRoomResponseDto;

public interface ChatRoomReadUseCase {

	List<ChatRoomResponseDto> findChatRoom(Integer memberId);

	ChatInfoResponseDto findChatRoomInfo(Integer chatRoomId);

}
