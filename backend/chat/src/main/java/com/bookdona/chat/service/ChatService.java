package com.bookdona.chat.service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.bson.types.ObjectId;
import org.springframework.stereotype.Service;

import com.bookdona.chat.document.ChatMessage;
import com.bookdona.chat.document.ChatRoom;
import com.bookdona.chat.dto.Member;
import com.bookdona.chat.dto.request.ChatMessageWriteRequest;
import com.bookdona.chat.dto.request.ChatRoomCreateRequest;
import com.bookdona.chat.dto.response.ChatMessageResponse;
import com.bookdona.chat.dto.response.ChatOpponentResponse;
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

@Service
@RequiredArgsConstructor
public class ChatService {

	private final ChatRoomRepository chatRoomRepository;
	private final ChatMessageRepository chatMessageRepository;
	private final DonationClient donationClient;
	private final MemberClient memberClient;

	public ChatRoomResponse addChatRoom(ChatRoomCreateRequest chatRoomCreateRequest) throws JsonProcessingException {

		// FeignDonation donation = FeignResponse.extractDataFromResponse(
		// 	donationClient.getDonationInfo(chatRoomCreateRequest.getDonationId()), FeignDonation.class);
		ChatRoom chatRoom = ChatRoom.builder()
			.tradeId(chatRoomCreateRequest.getTradeId())
			.participant1Nickname(chatRoomCreateRequest.getSenderNickname())
			.participant2Nickname(chatRoomCreateRequest.getReceiverNickname())
			.isLive(true)
			.build();

		chatRoomRepository.save(chatRoom);

		ChatRoomResponse chatRoomResponse = ChatRoomResponse.builder()
			.tradeId(chatRoomCreateRequest.getTradeId())
			.build();
		return chatRoomResponse;
	}

	public void addChatMessage(Long tradeId, ChatMessageWriteRequest chatMessageWriteRequest) {
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
	}

	// TODO: member feign
	// TODO: 책정보는 프론트에서 요청
	// 마지막 채팅, 마지막 채팅 시간, 상대방 닉네임
	public List<ChatRoomResponse> findChatRoomList(Long memberId) throws JsonProcessingException {
		// memberId로 페인쏴서 닉네임 받아오기
		String memberNickname = "";
		// 채팅방 리스트 불러옴
		List<ChatRoom> chatRoomList = chatRoomRepository.findByParticipant1NicknameOrParticipant1Nickname(
			memberNickname, memberNickname);

		// 채팅방 리스트의 정보를 통해 마지막 채팅 정보 불러옴
		Map<Long, ChatMessage> lastChatMessageMap = chatMessageRepository
			.findByIdIn(
				chatRoomList.stream()
					.map(chatRoom -> chatRoom.getLastChatId())
					.collect(Collectors.toList())
			).stream()
			.collect(Collectors.toMap(ChatMessage::getTradeId, chatMessage -> chatMessage));

		// 채팅방 정보와 마지막 메시지를 조합하여 결과 리스트 생성
		List<ChatRoomResponse> responseList = chatRoomList.stream().map(chatRoom -> {
			ChatMessage lastMessage = lastChatMessageMap.get(chatRoom.getLastChatId());
			String opponentNickname = chatRoom.getParticipant1Nickname().equals(memberNickname)
				? chatRoom.getParticipant2Nickname() : chatRoom.getParticipant1Nickname();

			// DTO에 상대방 닉네임과 마지막 메시지 내용 설정
			return new ChatRoomResponse(chatRoom.getTradeId(), opponentNickname, lastMessage.getMessage(),
				lastMessage.getCreatedAt());
		}).collect(Collectors.toList());

		return responseList;
	}

	public void existChatRoom(Long tradeId) {
		ChatRoom chatRoom = chatRoomRepository.findByTradeId(tradeId)
			.orElseThrow(() -> new BusinessException("존재하지 않는 채팅방입니다."));
		// if (chatRoom.getDonorId().equals(memberId) || chatRoom.getRequesterId().equals(memberId)) {
		// 	chatRoom.kill();
		// 	chatRoomRepository.save(chatRoom);
		// } else
		// 	throw new BusinessException("잘못된 접근입니다.");
	}

	// TODO: member feign
	// TODO: member feign 이 필요 한지 모르겠음, 프론트에서 구분 가능할 것 같은데
	public List<ChatMessageResponse> findChatMessageList(long tradeId, long memberId) throws JsonProcessingException {
		ChatRoom chatRoom = chatRoomRepository.findByTradeId(tradeId)
			.orElseThrow(() -> new BusinessException("존재하지 않는 채팅방입니다."));

		// feign
		String memberNickname = "";

		return chatMessageRepository.findByTradeId(chatRoom.getTradeId())
			.stream()
			.map(chatMessage -> ChatMessageResponse.builder()
				.senderNickname(chatMessage.getSenderNickname())
				.message(chatMessage.getMessage())
				.createdAt(chatMessage.getCreatedAt())
				.build())
			.collect(Collectors.toList());
	}

	// public ChatOpponentResponse findChatOpponent(String chatRoomId, Long memberId) throws JsonProcessingException {
	// 	ChatRoom chatRoom = chatRoomRepository.findById(new ObjectId(chatRoomId))
	// 		.orElseThrow(() -> new BusinessException("존재하지 않는 채팅방입니다."));
	// 	Long opponentId = chatRoom.getOpponent(memberId);
	// 	FeignMember feignMember = FeignResponse.extractDataFromResponse(memberClient.getMemberInfo(opponentId),
	// 		FeignMember.class);
	//
	// 	return ChatOpponentResponse.builder()
	// 		.member(Member.builder()
	// 			.memberId(feignMember.getMemberId())
	// 			.nickname(feignMember.getNickname())
	// 			.image(feignMember.getImage())
	// 			.build())
	// 		.build();
	// }
}
