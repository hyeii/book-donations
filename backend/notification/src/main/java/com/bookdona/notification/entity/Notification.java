package com.bookdona.notification.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Table(name = "notifications")
public class Notification {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long notificationId;

	private Object FetchType;

	private long memberId;

	private String title;

	private String message;

	private Object EnumType;

	@Enumerated(javax.persistence.EnumType.STRING)
	private NotificationType type;

	@Enumerated(javax.persistence.EnumType.STRING)
	private NotificationStatus status;

	@Column(columnDefinition = "TEXT")
	private String payload;

	private LocalDateTime createdAt;
	@javax.persistence.Id
	private Long id;
}
