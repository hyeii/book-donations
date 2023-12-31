package com.bookdone.trade.application;

import java.util.Optional;

import com.bookdone.trade.application.repository.TradeRepository;
import com.bookdone.trade.infra.entity.TradeEntity;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class FindTradeUseCase {

    private final TradeRepository tradeRepository;

    public TradeStatus findTradeStatus(Long donationId, Long memberId) {
        return tradeRepository.findTradeByDonationIdAndMemberId(donationId, memberId);
    }

	public TradeEntity findDonationIdByTradeId(Long tradeId) {
		return tradeRepository.findById(tradeId);
	}
}
