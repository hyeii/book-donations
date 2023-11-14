package com.bookdona.notification.entity;

import com.bookdona.notification.dto.NotificationResponseDto;
import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Getter
@Table(name = "push_notification")
public class NotificationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long memberId;

    private String message;

    @Column(columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime createdAt;

    public NotificationResponseDto toResponseDto() {
        return NotificationResponseDto.builder()
                .id(this.id)
                .memberId(this.memberId)
                .message(this.message)
                .createdAt(this.createdAt)
                .build();
    }
}
