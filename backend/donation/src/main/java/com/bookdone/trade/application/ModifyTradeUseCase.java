package com.bookdone.trade.application;

import com.bookdone.trade.application.repository.TradeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class ModifyTradeUseCase {
    private final TradeRepository tradeRepository;

    public void changeStatusToDonationRequested(Long donationId, Long memberId) {
        tradeRepository.updateStatus(donationId, memberId, TradeStatus.DONATION_REQUESTED);
    }

    public void changeStatusToDonationConfirmed(Long donationId, Long memberId) {
        tradeRepository.updateStatus(donationId, memberId, TradeStatus.DONATION_CONFIRMED);
    }

    public void changeStatusToCompletionRequested(Long donationId, Long memberId) {
        tradeRepository.updateStatus(donationId, memberId, TradeStatus.COMPLETION_REQUESTED);
    }

    public void changeStatusToCompletionConfirmed(Long donationId, Long memberId) {
        tradeRepository.updateStatus(donationId, memberId, TradeStatus.COMPLETION_CONFIRMED);
    }
}
