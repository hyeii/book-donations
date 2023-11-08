package com.bookdone.history.infra.database;

import com.bookdone.history.application.HistoryStatus;
import com.bookdone.history.application.repository.HistoryRepository;
import com.bookdone.history.domain.History;
import com.bookdone.history.infra.entity.HistoryEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class HistoryRepositoryImpl implements HistoryRepository {
    private final JpaHistoryRepository jpaHistoryRepository;

    @Override
    public Long updateHistory(History history) {
        HistoryEntity historyEntity = jpaHistoryRepository.findByDonationIdAndMemberId(history.getDonationId(), history.getMemberId())
                .orElseThrow(() -> new IllegalArgumentException("해당 히스토리가 없습니다."));
        historyEntity.updateContent(history.getContent());
        historyEntity.changeStatusToWritten();

        return jpaHistoryRepository.save(historyEntity).getId();
    }

    @Override
    public History findById(Long id) {
        HistoryEntity historyEntity = jpaHistoryRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 히스토리가 없습니다."));
        return History.createHistory(historyEntity);
    }

    @Override
    public History findByDonationIdAndMemberId(Long donationId, Long memberId) {
        HistoryEntity historyEntity = jpaHistoryRepository.findByDonationIdAndMemberId(donationId, memberId)
                .orElseThrow(() -> new IllegalArgumentException("해당 히스토리가 없습니다."));
        return History.createHistory(historyEntity);
    }

    @Override
    public List<History> findAllByDonationId(Long donationId) {
        List<HistoryEntity> historyEntityList = jpaHistoryRepository.findAllByDonationIdAndStatusIsWritten(donationId);

        return historyEntityList.stream().map(History::createHistory).collect(Collectors.toList());
    }

    @Override
    public Long countAllByDonationId(Long donationId) {
        return jpaHistoryRepository.countAllByDonationId(donationId);
    }

    @Override
    public History findLastHistoryByDonationId(Long donationId) {
        Optional<HistoryEntity> historyEntity = jpaHistoryRepository.findTopByDonationIdOrderByDonatedAtDesc(donationId);
        return historyEntity.map(History::createHistory).orElse(null);
    }

    @Override
    public void saveDummyHistory(Long donationId, Long memberId) {
        HistoryEntity historyEntity = HistoryEntity.builder()
                .donationId(donationId)
                .memberId(memberId)
                .status(HistoryStatus.UNWRITTEN)
                .build();
        jpaHistoryRepository.save(historyEntity);
    }
}
