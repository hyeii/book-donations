package com.bookdone.history.domain;

import com.bookdone.history.application.HistoryStatus;
import com.bookdone.history.dto.request.HistoryAddRequest;
import com.bookdone.history.infra.entity.HistoryEntity;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;

@Builder
@Getter
public class History {
    private Long id;
    private Long donationId;
    private Long memberId;
    private String content;
    private LocalDateTime createdAt;
    private LocalDateTime donatedAt;
    private HistoryStatus historyStatus;

    public static History createHistory(HistoryAddRequest historyAddRequest) {
        return History.builder()
                .donationId(historyAddRequest.getDonationId())
                .memberId(historyAddRequest.getMemberId())
                .content(historyAddRequest.getContent())
                .historyStatus(HistoryStatus.WRITTEN)
                .build();
    }

    public static History createHistory(HistoryEntity historyEntity) {
        return History.builder()
                .id(historyEntity.getId())
                .donationId(historyEntity.getDonationId())
                .memberId(historyEntity.getMemberId())
                .content(historyEntity.getContent())
                .historyStatus(historyEntity.getStatus())
                .createdAt(historyEntity.getCreatedAt())
                .donatedAt(historyEntity.getDonatedAt())
                .build();
    }

    public HistoryEntity createEntity() {
        return HistoryEntity.fromDomain(this);
    }
}
