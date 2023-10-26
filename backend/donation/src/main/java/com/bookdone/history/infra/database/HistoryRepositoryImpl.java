package com.bookdone.history.infra.database;

import com.bookdone.history.application.repository.HistoryRepository;
import com.bookdone.history.infra.entity.HistoryEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class HistoryRepositoryImpl implements HistoryRepository {
    private final JpaHistoryRepository jpaHistoryRepository;

    public void save(HistoryEntity historyEntity) {
        jpaHistoryRepository.save(historyEntity);
    }
    @Override
    public Optional<HistoryEntity> findById(Long id) {
        return jpaHistoryRepository.findById(id);
    }

    @Override
    public Optional<HistoryEntity> findByDonationIdAndMemberId(Long donationId, Long memberId) {
        return jpaHistoryRepository.findByDonationIdAndMemberId(donationId, memberId);
    }
}
