package com.bookdone.history.infra.database;

import com.bookdone.history.infra.entity.HistoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface JpaHistoryRepository extends JpaRepository<HistoryEntity, Long> {

    Optional<HistoryEntity> findById(Long id);

    Optional<HistoryEntity> findByDonationIdAndMemberId(Long donationId, Long memberId);

    @Query(value = "SELECT h " +
            "FROM HistoryEntity h " +
            "WHERE h.memberId = :memberId AND h.status = com.bookdone.history.application.HistoryStatus.WRITTEN " +
            "ORDER BY h.donatedAt DESC")
    List<HistoryEntity> findAllByMemberIdAndStatusIsWritten(Long memberId);

    @Query(value = "SELECT h " +
            "FROM HistoryEntity h " +
            "WHERE h.donationId = :donationId AND h.status = com.bookdone.history.application.HistoryStatus.WRITTEN " +
            "ORDER BY h.donatedAt DESC")
    List<HistoryEntity> findAllByDonationIdAndStatusIsWritten(Long donationId);

    Long countAllByDonationId(Long donationId);

    Optional<HistoryEntity> findTopByDonationIdOrderByDonatedAtDesc(Long donationId);
}
