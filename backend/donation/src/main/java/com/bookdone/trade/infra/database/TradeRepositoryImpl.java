package com.bookdone.trade.infra.database;

import com.bookdone.trade.application.TradeStatus;
import com.bookdone.trade.application.repository.TradeRepository;
import com.bookdone.trade.infra.entity.TradeEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class TradeRepositoryImpl implements TradeRepository {
    private final JpaTradeRepository jpaTradeRepository;

    @Override
    public void addTrade(Long donationId, Long memberId) {
        TradeEntity tradeEntity = TradeEntity.builder()
                .donationId(donationId)
                .memberId(memberId)
                .tradeStatus(TradeStatus.NONE)
                .build();

        jpaTradeRepository.findByDonationIdAndMemberId(donationId, memberId)
                .ifPresent(entity -> tradeEntity.updateId(entity.getId()));

        jpaTradeRepository.save(tradeEntity);
    }

    @Override
    public void updateStatus(Long donationId, Long memberId, TradeStatus tradeStatus) {
        TradeEntity tradeEntity = jpaTradeRepository.findByDonationIdAndMemberId(donationId, memberId)
                .orElseThrow(() -> new IllegalArgumentException("도네이션이 존재하지 않습니다."));
        if(tradeEntity.getTradeStatus() == tradeStatus)
            throw new IllegalArgumentException("이미 동일한 거래 상태입니다.");
        tradeEntity.updateStatus(tradeStatus);
        jpaTradeRepository.save(tradeEntity);
    }

}
