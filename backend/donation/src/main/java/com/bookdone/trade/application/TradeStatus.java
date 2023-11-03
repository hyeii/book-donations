package com.bookdone.trade.application;

import lombok.Getter;

@Getter
public enum TradeStatus {
    NONE(0),
    DONATION_REQUESTED(1),
    DONATION_CONFIRMED(2),
    COMPLETION_REQUESTED(3),
    COMPLETION_CONFIRMED(4);

    private Integer value;

    TradeStatus(Integer value) {
        this.value = value;
    }
}
