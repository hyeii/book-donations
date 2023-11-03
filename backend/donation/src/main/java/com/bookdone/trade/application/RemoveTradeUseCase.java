package com.bookdone.trade.application;

import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.trade.application.repository.TradeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class RemoveTradeUseCase {
    private final TradeRepository tradeRepository;
    private final DonationRepository donationRepository;

    public void removeTrade(Long donationId, Long memberId) {
        tradeRepository.deleteTrade(donationId, memberId);
        Donation donation = donationRepository.findById(donationId);
        donation.changeStatusToKeeping();
        donationRepository.save(donation);
    }
}
