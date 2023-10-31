package com.bookdone.trade.application;

import lombok.Getter;

@Getter
public enum TradeStatus {
    NONE,
    DONATION_REQUESTED,
    DONATION_CONFIRMED,
    COMPLETION_REQUESTED,
    COMPLETION_CONFIRMED
}
