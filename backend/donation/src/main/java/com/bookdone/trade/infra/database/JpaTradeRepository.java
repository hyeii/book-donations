package com.bookdone.trade.infra.database;

import com.bookdone.trade.infra.entity.TradeEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface JpaTradeRepository extends JpaRepository<TradeEntity, Long> {
    Optional<TradeEntity> findByDonationIdAndMemberId(Long donationId, Long memberId);

    Optional<TradeEntity> findById(Long tradeId);
}
