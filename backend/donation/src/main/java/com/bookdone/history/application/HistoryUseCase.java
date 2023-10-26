package com.bookdone.history.application;

import com.bookdone.history.application.repository.HistoryRepository;
import com.bookdone.history.infra.database.JpaHistoryRepository;
import com.bookdone.history.infra.entity.HistoryEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class HistoryUseCase {
    private final HistoryRepository historyRepository;
    private final JpaHistoryRepository jpaHistoryRepository;

    public void updateHistory(Long memberId, Long donationId) {
        HistoryEntity history = historyRepository.findByDonationIdAndMemberId(donationId, memberId)
                .orElseThrow(() -> new IllegalArgumentException("해당 히스토리가 없습니다."));
        jpaHistoryRepository.save(history);
    }
}
