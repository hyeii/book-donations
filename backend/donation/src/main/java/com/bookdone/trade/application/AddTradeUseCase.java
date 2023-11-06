package com.bookdone.trade.application;

import com.bookdone.trade.application.repository.TradeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class AddTradeUseCase {

    private final TradeRepository tradeRepository;

    public void tradeAdd(Long donationId, Long memberId) {
        tradeRepository.addTrade(donationId, memberId);
    }
}
