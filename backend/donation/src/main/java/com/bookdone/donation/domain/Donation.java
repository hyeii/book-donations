package com.bookdone.donation.domain;

import com.bookdone.donation.dto.request.DonationAddRequest;
import com.bookdone.donation.infra.entity.DonationEntity;
import lombok.Builder;

@Builder
public class Donation {
    private Long bookId;
    private Long memberId;
    private Integer address;
    private String content;
    private Integer status;
    private boolean canDelivery;

    public static Donation createDonation(DonationAddRequest donationAddRequest) {
        return Donation
                .builder()
                .address(donationAddRequest.getAddress())
                .bookId(donationAddRequest.getBookId())
                .memberId(donationAddRequest.getMemberId())
                .content(donationAddRequest.getContent())
                .build();
    }

    public static Donation createDonation(DonationEntity donationEntity) {
        return Donation
                .builder()
                .content(donationEntity.getContent())
                .build();
    }

    public static DonationEntity createEntity(Donation donation) {
        return new DonationEntity();
    }

}
