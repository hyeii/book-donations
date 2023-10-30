package com.bookdone.history.infra.entity;

import com.bookdone.history.application.HistoryStatus;
import com.bookdone.history.domain.History;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class HistoryEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    //TODO: Donation에 OneToMany 지정해주세욤 용균님
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
