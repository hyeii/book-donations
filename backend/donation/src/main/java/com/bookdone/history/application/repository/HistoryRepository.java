package com.bookdone.history.application.repository;

import com.bookdone.history.infra.entity.HistoryEntity;

import java.util.Optional;

public interface HistoryRepository {
    public Optional<HistoryEntity> findById(Long id);

    public Optional<HistoryEntity> findByDonationIdAndMemberId(Long donationId, Long memberId);
}
