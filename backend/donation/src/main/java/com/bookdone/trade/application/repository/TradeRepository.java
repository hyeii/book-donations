package com.bookdone.trade.application.repository;

import com.bookdone.trade.application.TradeStatus;

public interface TradeRepository {

    Long addTrade(Long donationId, Long memberId);
    void updateStatus(Long donationId, Long memberId, TradeStatus tradeStatus);
    void deleteTrade(Long donationId, Long memberId);
    TradeStatus findTradeByDonationIdAndMemberId(Long donationId, Long memberId);
}
