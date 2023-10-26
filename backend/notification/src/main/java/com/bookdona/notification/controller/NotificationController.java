package com.bookdona.notification.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookdona.global.response.BaseResponse;
import com.bookdona.notification.entity.Notification;
import com.bookdona.notification.service.NotificationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/api/notifications")
@RequiredArgsConstructor
public class NotificationController {

	private final NotificationService notificationService;

	@GetMapping("/get")
	public String getNotifications() {
		return "notifications";
	}

	@PatchMapping("/{notificationId}}")
	public ResponseEntity<?> markAsRead(@PathVariable Long notificationId) {
		Notification updatedNotification = notificationService.markAsRead(notificationId);
		return BaseResponse.ok(HttpStatus.OK, "알림을 읽음 처리하였습니다.");
	}

	@GetMapping("/members/{memberId}/unread")
	public ResponseEntity<?> getUnreadNotificationsByMemberId(@PathVariable long memberId) {
		List<Notification> notifications = notificationService.unreadNotification(memberId);
		return BaseResponse.okWithData(HttpStatus.OK, "읽지 않은 알림들을 조회하였습니다.", notifications);
	}
}
