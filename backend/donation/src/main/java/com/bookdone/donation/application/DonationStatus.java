package com.bookdone.donation.application;

import lombok.Getter;

@Getter
public enum DonationStatus {

    KEEPING(1),
    DONATING(2)
    ;

    DonationStatus(Integer statusCode) {
        this.statusCode = statusCode;
    }

    private final Integer statusCode;
}
