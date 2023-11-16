package com.bookdone.history.infra.entity;

import com.bookdone.history.application.HistoryStatus;
import com.bookdone.history.domain.History;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "history")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@EntityListeners(AuditingEntityListener.class)
public class HistoryEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "donation_id")
    private Long donationId;

    @Column(name = "member_id")
    private Long memberId;

    private String content;

    @CreatedDate
    @Column(name = "donated_at")
    private LocalDateTime donatedAt;

    @LastModifiedDate
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private HistoryStatus status;

    public static HistoryEntity fromDomain(History history) {
        return HistoryEntity
                .builder()
                .id(history.getId())
                .donationId(history.getDonationId())
                .memberId(history.getMemberId())
                .content(history.getContent())
                .status(history.getHistoryStatus())
                .build();
    }

    public void updateContent(String content) {
        this.content = content;
    }

    public void changeStatusToWritten() {
        this.status = HistoryStatus.WRITTEN;
    }
}
