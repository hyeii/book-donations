package com.bookdona.notification.service;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.stereotype.Service;

import com.bookdona.global.clinet.api.MemberClient;
import com.bookdona.global.clinet.dto.MemberResponse;
import com.bookdona.global.util.FeignResponseUtil;
import com.bookdona.notification.dto.NotificationRequestDto;
import com.bookdona.notification.entity.NotificationEntity;
import com.bookdona.notification.entity.NotificationStatus;
import com.bookdona.notification.repository.NotificationRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class NotificationService {

	private final NotificationRepository notificationRepository;
	private final FirebaseMessaging firebaseMessaging;
	private final MemberClient memberClient;

	public NotificationEntity markAsRead(Long notificationId) {
		NotificationEntity notificationEntity = notificationRepository.findById(notificationId)
			.orElseThrow(() -> new RuntimeException("알림이 없습니다."));

		notificationEntity.setStatus(NotificationStatus.READ);
		return notificationRepository.save(notificationEntity);
	}

	public List<NotificationEntity> unreadNotification(long memberId) {
		return notificationRepository.findByMemberIdAndStatus(memberId, NotificationStatus.UNREAD);
	}

	public void sendNotificationByToken(NotificationRequestDto requestDto) throws HttpMessageNotReadableException {
		log.info("member Id = {}", requestDto.getTargetUserId());
		Long userId = requestDto.getTargetUserId();
		ResponseEntity<?> response = memberClient.getMemberByMemberId(userId);
		MemberResponse member = null;
		try {
			member = FeignResponseUtil.extractDataFromResponse(response, MemberResponse.class);
		} catch (JsonProcessingException ex) {
			throw new HttpMessageNotReadableException("Member Client Parsing 오류 발생");
		}
		log.info("member = {}", member);

		if (member != null) {
			if (member.getFcmToken() != null) {
				Notification notification = Notification.builder()
					.setTitle(requestDto.getTitle())
					.setBody(requestDto.getBody())
					// .setImage(requestDto.getImage())
					.build();

				Message message = Message.builder()
					.setToken(member.getFcmToken())
					.setNotification(notification)
					// .putAllData(requestDto.getData())
					.build();

				try {
					firebaseMessaging.send(message);
					log.info("알림을 성공적으로 전송했습니다. targetUserId = {}", requestDto.getTargetUserId());
				} catch (FirebaseMessagingException ex) {
					throw new IllegalArgumentException(
						"알림 보내기를 실패하였습니다. targetUserId=" + requestDto.getTargetUserId());
				}
			} else {
				throw new IllegalArgumentException(
					"서버에 저장된 해당 유저의 FirebaseToken이 존재하지 않습니다. targetUserId=" + requestDto.getTargetUserId());
			}
		} else {
			throw new IllegalArgumentException("해당 유저가 존재하지 않습니다. targetUserId=" + requestDto.getTargetUserId());
		}
	}
}

