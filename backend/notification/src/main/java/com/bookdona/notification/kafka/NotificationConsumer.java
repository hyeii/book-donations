package com.bookdona.notification.kafka;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

import com.bookdona.notification.dto.NotificationDto;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class NotificationConsumer {

	@KafkaListener(topics = "notification-topic", groupId = "notification-consumer-group")
	public void listen(NotificationDto notification) {
		System.out.println("Received Notification: " + notification);
	}
}