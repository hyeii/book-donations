package com.bookdona.notification.dto;

import lombok.*;

import java.io.Serializable;
import java.time.LocalDateTime;


@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class NotificationResponseDto implements Serializable {
    private Long id;
    private Long memberId;
    private String message;
    private LocalDateTime createdAt;
}