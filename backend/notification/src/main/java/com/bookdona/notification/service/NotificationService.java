package com.bookdona.notification.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookdona.notification.entity.Notification;
import com.bookdona.notification.entity.NotificationStatus;
import com.bookdona.notification.repository.NotificationRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class NotificationService {

	private final NotificationRepository notificationRepository;

	public Notification markAsRead(Long notificationId) {
		Notification notification = notificationRepository.findById(notificationId)
			.orElseThrow(() -> new RuntimeException("알림이 없습니다."));

		notification.setStatus(NotificationStatus.READ);
		return notificationRepository.save(notification);
	}

	public List<Notification> unreadNotification(long memberId) {
		return notificationRepository.findByMemberIdAndStatus(memberId, NotificationStatus.UNREAD);
	}
}

