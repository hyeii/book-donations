package com.bookdona.chat.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookdona.chat.document.ChatMessage;
import com.bookdona.chat.document.ChatRoom;
import com.bookdona.chat.dto.request.ChatMessageWriteRequest;
import com.bookdona.chat.dto.request.ChatRoomCreateRequest;
import com.bookdona.chat.dto.response.ChatMessageResponse;
import com.bookdona.chat.dto.response.ChatRoomResponse;
import com.bookdona.chat.repository.ChatMessageRepository;
import com.bookdona.chat.repository.ChatRoomRepository;
import com.bookdona.client.DonationClient;
import com.bookdona.client.MemberClient;
import com.bookdona.client.dto.FeignBookInfo;
import com.bookdona.client.dto.FeignBookInfoList;
import com.bookdona.client.dto.FeignDonation;
import com.bookdona.client.dto.FeignMember;
import com.bookdona.client.dto.FeignMemberList;
import com.bookdona.global.exception.BusinessException;
import com.bookdona.global.util.FeignResponse;
import com.fasterxml.jackson.core.JsonProcessingException;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ChatService {

	private final ChatRoomRepository chatRoomRepository;
	private final ChatMessageRepository chatMessageRepository;
	private final DonationClient donationClient;
	@Qualifier("testClient")
	private final MemberClient memberClient;

	public void addChatRoom(ChatRoomCreateRequest chatRoomCreateRequest) {
		Optional<ChatRoom> existingChatRoom = chatRoomRepository.findByTradeIdAndUsersInAnyOrder(
			chatRoomCreateRequest.getTradeId(),
			chatRoomCreateRequest.getUser1(),
			chatRoomCreateRequest.getUser2());

		if (existingChatRoom.isPresent()) {
			ChatRoom room = existingChatRoom.get();
			if (!room.getIsLive()) {
				room.setIsLive(true); // 재사용 , 
				chatMessageRepository.deleteAllByTradeId(room.getTradeId()); // 이전 방 채팅 기록 삭제
				chatRoomRepository.save(room);
			} else {
				throw new IllegalArgumentException("이미 존재하는 채팅방입니다: " + room);
			}
		} else {
			// 존재하지 않는 경우, 새로운 채팅방 생성
			ChatRoom chatRoom = ChatRoom.builder()
				.tradeId(chatRoomCreateRequest.getTradeId())
				.user1(chatRoomCreateRequest.getUser1())
				.user2(chatRoomCreateRequest.getUser2())
				.isLive(true)
				.isbn(chatRoomCreateRequest.getIsbn())
				.build();
			chatRoomRepository.save(chatRoom);
		}
	}

	@Transactional
	public ChatMessageResponse addChatMessage(Long tradeId, ChatMessageWriteRequest chatMessageWriteRequest) {
		ChatMessage chatMessage = ChatMessage.builder()
			.message(chatMessageWriteRequest.getMessage())
			.tradeId(tradeId)
			.senderNickname(chatMessageWriteRequest.getSenderNickname())
			.build();

		ChatRoom chatRoom = chatRoomRepository.findByTradeId(tradeId)
			.orElseThrow(() -> new BusinessException("존재하지 않는 채팅방입니다."));

		if (!chatRoom.getIsLive())
			throw new BusinessException("종료된 채팅방입니다.");

		chatMessageRepository.save(chatMessage);
		chatRoom.updateLastChat(chatMessage.getId());
		chatRoomRepository.save(chatRoom);

		log.info("chatMessage: {}", chatMessage);

		return ChatMessageResponse.builder()
			.tradeId(chatMessage.getTradeId())
			.senderNickname(chatMessage.getSenderNickname())
			.message(chatMessage.getMessage())
			.createdAt(chatMessage.getCreatedAt())
			.build();
	}

	// TODO: member feign
	// TODO: 책정보는 프론트에서 요청
	// 마지막 채팅, 마지막 채팅 시간, 상대방 닉네임
	public List<ChatRoomResponse> findChatRoomList(Long memberId) throws JsonProcessingException {
		// memberId로 페인쏴서 닉네임 받아오기
		FeignMember feignMember = FeignResponse.extractDataFromResponse(memberClient.getMemberByMemberId(memberId),
			FeignMember.class);
		log.info("feignMember: {}", feignMember);
		String memberNickname = feignMember.getNickname();

		// true 채팅방 리스트 불러옴
		List<ChatRoom> chatRoomList = chatRoomRepository.findByUser1OrUser2AndIsLiveTrue(
			memberNickname, memberNickname);

		// 마지막 채팅 메시지 정보를 가져오기
		Map<Long, ChatMessage> lastChatMessageMap = chatMessageRepository
			.findByIdIn(chatRoomList.stream()
				.map(ChatRoom::getLastChatId)
				.filter(Objects::nonNull) // null이 아닌 lastChatId만 필터링
				.collect(Collectors.toList()))
			.stream()
			.collect(Collectors.toMap(ChatMessage::getTradeId, chatMessage -> chatMessage));

		// 채팅방 정보와 마지막 메시지를 조합하여 결과 리스트 생성
		List<ChatRoomResponse> responseList = chatRoomList.stream().map(chatRoom -> {
			String lastMessageContent = "";
			LocalDateTime lastMessageCreatedAt = null;

			if (lastChatMessageMap.containsKey(chatRoom.getTradeId())) {
				ChatMessage lastMessage = lastChatMessageMap.get(chatRoom.getTradeId());
				lastMessageContent = lastMessage.getMessage();
				lastMessageCreatedAt = lastMessage.getCreatedAt();
			}
			return new ChatRoomResponse(chatRoom.getTradeId(), memberNickname.equals(chatRoom.getUser1()) ?
				chatRoom.getUser2() : chatRoom.getUser1(), lastMessageContent, lastMessageCreatedAt);
		}).collect(Collectors.toList());

		log.info("responseList: {}", responseList);
		return responseList;
	}

	public List<ChatMessageResponse> findChatMessageList(long tradeId) {
		ChatRoom chatRoom = chatRoomRepository.findByTradeId(tradeId)
			.orElseThrow(() -> new BusinessException("존재하지 않는 채팅방입니다."));

		// feign
		// FeignMember feignMember = FeignResponse.extractDataFromResponse(memberClient.getMemberByMemberId(memberId),
		// 	FeignMember.class);
		// log.info("feignMember: {}", feignMember);
		// String memberNickname = feignMember.getNickname();

		List<ChatMessageResponse> collect = chatMessageRepository.findByTradeId(chatRoom.getTradeId())
			.stream()
			.map(chatMessage -> ChatMessageResponse.builder()
				.tradeId(chatMessage.getTradeId())
				.senderNickname(chatMessage.getSenderNickname())
				.message(chatMessage.getMessage())
				.createdAt(chatMessage.getCreatedAt())
				.build())
			.collect(Collectors.toList());

		log.info("collect: {}", collect);
		return collect;
	}

}
