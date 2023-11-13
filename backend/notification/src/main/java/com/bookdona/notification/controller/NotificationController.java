package com.bookdona.notification.controller;

import com.bookdona.notification.dto.NotificationResponseDto;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.bookdona.global.response.BaseResponse;
import com.bookdona.notification.dto.NotificationDto;
import com.bookdona.notification.dto.NotificationRequestDto;
import com.bookdona.notification.entity.NotificationEntity;
import com.bookdona.notification.service.NotificationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Controller
@RequestMapping("/api/notifications")
@RequiredArgsConstructor
@Slf4j
public class NotificationController {

	private final NotificationService notificationService;
	private final KafkaTemplate<String, NotificationRequestDto> kafkaTemplate;

	@PostMapping("/test/kafka")
	public ResponseEntity<?> sendKafkaMessage(@RequestBody NotificationRequestDto requestDto) {
		kafkaTemplate.send("notification-topic", requestDto);
		return BaseResponse.ok(HttpStatus.OK, "알림 전송 성공");
	}


	@DeleteMapping("/{notificationId}")
	public ResponseEntity<?> deleteNotification(@PathVariable Long notificationId) {
		notificationService.removeNotification(notificationId);
		return BaseResponse.ok(HttpStatus.OK, "알림을 읽음 처리하였습니다.");
	}

	@GetMapping
	public ResponseEntity<?> findNotificationsByMemberId(@RequestHeader("member-id") Long memberId) {
		List<NotificationResponseDto> notifications = notificationService.getNotifications(memberId);
		return BaseResponse.okWithData(HttpStatus.OK, "알림 리스트 조회 완료", notifications);
	}

	@PostMapping("/send")
	public ResponseEntity<?> sendNotification(@RequestBody NotificationDto notificationDto) {
		log.info("*** {}", notificationDto);
		// kafkaTemplate.send("notification-topic", notificationDto);
		// 키를 사용하는 경우
		// kafkaTemplate.send("notification-topic", "key", notificationDto);
		return BaseResponse.ok(HttpStatus.OK, "알림을 전송하였습니다.");
	}

}
