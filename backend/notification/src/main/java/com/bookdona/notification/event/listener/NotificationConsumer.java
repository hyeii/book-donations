package com.bookdona.notification.event.listener;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

import com.bookdona.notification.dto.NotificationDto;
import com.bookdona.notification.dto.NotificationRequestDto;
import com.bookdona.notification.service.NotificationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Component
@RequiredArgsConstructor
@Slf4j
public class NotificationConsumer {
	private final NotificationService notificationService;

	@KafkaListener(topics = "notification-topic", groupId = "notification-group")
	public void listen(NotificationRequestDto requestDto) {
		log.info("Kafka Event Catch!!!!!!!!!!!!!!!!!!!!!!");
		notificationService.sendNotificationByToken(requestDto);
	}
}