package com.bookdona.notification.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookdona.global.response.BaseResponse;
import com.bookdona.notification.dto.NotificationDto;
import com.bookdona.notification.entity.Notification;
import com.bookdona.notification.service.NotificationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/api/notifications")
@RequiredArgsConstructor
@Slf4j
public class NotificationController {

	private final NotificationService notificationService;
	private final KafkaTemplate<String, NotificationDto> kafkaTemplate;

	@GetMapping("/get")
	public String getNotifications() {
		return "notifications";
	}

	@PatchMapping("/{notificationId}")
	public ResponseEntity<?> markAsRead(@PathVariable Long notificationId) {
		Notification updatedNotification = notificationService.markAsRead(notificationId);
		return BaseResponse.ok(HttpStatus.OK, "알림을 읽음 처리하였습니다.");
	}

	@GetMapping("/members/{memberId}/unread")
	public ResponseEntity<?> getUnreadNotificationsByMemberId(@PathVariable long memberId) {
		List<Notification> notifications = notificationService.unreadNotification(memberId);
		return BaseResponse.okWithData(HttpStatus.OK, "읽지 않은 알림들을 조회하였습니다.", notifications);
	}

	@PostMapping("/send")
	public ResponseEntity<?> sendNotification(@RequestBody NotificationDto notificationDto) {
		log.info("*** {}", notificationDto);
		kafkaTemplate.send("notification-topic", notificationDto);
		// 키를 사용하는 경우
		// kafkaTemplate.send("notification-topic", "key", notificationDto);
		return BaseResponse.ok(HttpStatus.OK, "알림을 전송하였습니다.");
	}

}
