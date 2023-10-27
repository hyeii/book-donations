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

		FeignDonation donation = FeignResponse.extractDataFromResponse(
			donationClient.getDonationInfo(chatRoomCreateRequest.getDonationId()), FeignDonation.class);
		ChatRoom chatRoom = ChatRoom.builder()
			.donorId(donation.getMemberId())
			.requesterId(chatRoomCreateRequest.getMemberId())
			.donationId(chatRoomCreateRequest.getDonationId())
			.isLive(true)
			.build();
		chatRoomRepository.save(chatRoom);
		ChatRoomResponse chatRoomResponse = ChatRoomResponse.builder()
			.chatRoomId(chatRoom.getId().toString())
			.build();
		return chatRoomResponse;
	}

	public List<ChatRoomResponse> findChatRoomList(Long memberId) throws JsonProcessingException {

		// 채팅방 리스트 불러옴
		List<ChatRoom> chatRoomList = chatRoomRepository.findByDonorIdOrRequesterId(memberId, memberId);

		// 채팅방 리스트의 정보를 통해 마지막 채팅 정보 불러옴
		Map<ObjectId, ChatMessage> lastChatMessageMap = chatMessageRepository
			.findByIdIn(
				chatRoomList.stream()
					.map(chatRoom -> chatRoom.getLastChatId())
					.collect(Collectors.toList())
			).stream()
			.collect(Collectors.toMap(ChatMessage::getId, chatMessage -> chatMessage));

		// 채팅방 리스트의 정보를 통해 책의 정보들을 불러옴
		Map<Long, FeignBookInfo.BookInfo> bookInfoMap = FeignResponse.extractDataFromResponse(
			donationClient.getBookInfoList(
				chatRoomList.stream()
					.map(ChatRoom::getDonationId)
					.collect(Collectors.toList())
			), FeignBookInfoList.class).toMap();

		// 채팅방 리스트의 정보를 통해 상대방의 닉네임을 불러옴
		Map<Long, String> memberMap = FeignResponse.extractDataFromResponse(
			memberClient.getMemberInfoList(
				chatRoomList.stream()
					.map(chatRoom -> chatRoom.getOpponent(memberId))
					.collect(Collectors.toList())
			)
			, FeignMemberList.class).toMap();

		// 정보를 합쳐서 응답리스트를 만듦
		return chatRoomList.stream()
			.map(chatRoom -> ChatRoomResponse.builder()
				.chatRoomId(chatRoom.getId().toString())
				.bookImage(bookInfoMap.get(chatRoom.getDonationId()).getBookImage())
				.bookTitle(bookInfoMap.get(chatRoom.getDonationId()).getBookTitle())
				.opponentNickname(memberMap.get(chatRoom.getOpponent(memberId)))
				.lastMessage(chatRoom.getLastChatId() == null ? null :
					lastChatMessageMap.get(chatRoom.getLastChatId()).getMessage())
				.lastMessageTime(chatRoom.getLastChatId() == null ? null :
					lastChatMessageMap.get(chatRoom.getLastChatId()).getCreatedAt())
				.isDonor(memberId == chatRoom.getDonorId() ? true : false)
				.build()
			)
			.collect(Collectors.toList());
	}

	public List<ChatMessageResponse> findChatMessageList(String chatRoomId) throws JsonProcessingException {
		ChatRoom chatRoom = chatRoomRepository.findById(new ObjectId(chatRoomId))
			.orElseThrow(() -> new BusinessException("존재하지 않는 채팅방입니다."));
		FeignMember donor = FeignResponse.extractDataFromResponse(
			memberClient.getMemberInfo(chatRoom.getDonorId()),
			FeignMember.class);
		FeignMember requester = FeignResponse.extractDataFromResponse(
			memberClient.getMemberInfo(chatRoom.getRequesterId()),
			FeignMember.class);

		return chatMessageRepository.findByChatRoomId(chatRoom.getId())
			.stream()
			.map(chatMessage -> ChatMessageResponse.builder()
				.message(chatMessage.getMessage())
				.createdAt(chatMessage.getCreatedAt())
				.author(
					chatMessage.getAuthorId().equals(donor.getMemberId())
						? Member.builder()
						.memberId(donor.getMemberId())
						.nickname(donor.getNickname())
						.image(donor.getImage())
						.build()
						: Member.builder()
						.memberId(requester.getMemberId())
						.nickname(requester.getNickname())
						.image(requester.getImage())
						.build())
				.build())
			.collect(Collectors.toList());
	}

	public ChatOpponentResponse findChatOpponent(String chatRoomId, Long memberId) throws JsonProcessingException {
		ChatRoom chatRoom = chatRoomRepository.findById(new ObjectId(chatRoomId))
			.orElseThrow(() -> new BusinessException("존재하지 않는 채팅방입니다."));
		Long opponentId = chatRoom.getOpponent(memberId);
		FeignMember feignMember = FeignResponse.extractDataFromResponse(memberClient.getMemberInfo(opponentId),
			FeignMember.class);

		return ChatOpponentResponse.builder()
			.member(Member.builder()
				.memberId(feignMember.getMemberId())
				.nickname(feignMember.getNickname())
				.image(feignMember.getImage())
				.build())
			.build();
	}

	public void addChatMessage(String chatRoomId, ChatMessageWriteRequest chatMessageWriteRequest, Long memberId) {

		ChatMessage chatMessage = ChatMessage.builder()
			.message(chatMessageWriteRequest.getMessage())
			.chatRoomId(new ObjectId(chatRoomId))
			.authorId(memberId)
			.build();
		ChatRoom chatRoom = chatRoomRepository.findById(new ObjectId(chatRoomId))
			.orElseThrow(() -> new BusinessException("존재하지 않는 채팅방입니다."));
		if (!chatRoom.getIsLive())
			throw new BusinessException("종료된 채팅방입니다.");
		chatMessageRepository.save(chatMessage);
		chatRoom.updateLastChat(chatMessage.getId());
		chatRoomRepository.save(chatRoom);
	}

	public void exitChatRoom(String chatRoomId, Long memberId) {
		ChatRoom chatRoom = chatRoomRepository.findById(new ObjectId(chatRoomId))
			.orElseThrow(() -> new BusinessException("존재하지 않는 채팅방입니다."));
		if (chatRoom.getDonorId().equals(memberId) || chatRoom.getRequesterId().equals(memberId)) {
			chatRoom.kill();
			chatRoomRepository.save(chatRoom);
		} else
			throw new BusinessException("잘못된 접근입니다.");
	}
}
