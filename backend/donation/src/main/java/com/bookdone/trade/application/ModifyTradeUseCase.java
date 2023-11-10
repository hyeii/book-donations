package com.bookdone.trade.application;

import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.history.application.repository.HistoryRepository;
import com.bookdone.trade.application.repository.TradeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class ModifyTradeUseCase {
    private final TradeRepository tradeRepository;
    private final DonationRepository donationRepository;
    private final HistoryRepository historyRepository;

    public void changeStatusToDonationRequested(Long donationId, Long memberId) {
        tradeRepository.updateStatus(donationId, memberId, TradeStatus.DONATION_REQUESTED);
        Donation donation = donationRepository.findById(donationId);
        donation.changeStatusToTrading();
        donationRepository.save(donation);
    }

    public void changeStatusToDonationConfirmed(Long donationId, Long memberId) {
        tradeRepository.updateStatus(donationId, memberId, TradeStatus.DONATION_CONFIRMED);
    }

    public void changeStatusToCompletionRequested(Long donationId, Long memberId) {
        tradeRepository.updateStatus(donationId, memberId, TradeStatus.COMPLETION_REQUESTED);
    }

    public Long changeStatusToCompletionConfirmed(Long donationId, Long memberId) {
        tradeRepository.updateStatus(donationId, memberId, TradeStatus.COMPLETION_CONFIRMED);

        Donation donation = donationRepository.findById(donationId);
        donation.changeStatusToKeeping();
        Long donorId = donation.getMemberId();
        donation.changeMemberId(memberId);
        donationRepository.save(donation);
        historyRepository.saveDummyHistory(donationId, memberId);
        return donorId;
    }
}
