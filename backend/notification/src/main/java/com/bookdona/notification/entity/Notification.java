package com.bookdona.notification.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;

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
	private Long id;

	@Enumerated(javax.persistence.EnumType.STRING)
	private NotificationType type;

	@Enumerated(javax.persistence.EnumType.STRING)
	private NotificationStatus status;

	private long memberId;

	private String title;

	private String message;

	@Column(columnDefinition = "TEXT")
	private String payload;

	@Column(columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private LocalDateTime createdAt;
}
