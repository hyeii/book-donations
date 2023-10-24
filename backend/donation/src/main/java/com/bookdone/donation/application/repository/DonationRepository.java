package com.bookdone.donation.application.repository;

import com.bookdone.donation.application.DonationStatus;
import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.infra.entity.DonationEntity;

import java.util.List;

public interface DonationRepository {

    public Long save(Donation donation);

    public List<DonationEntity> findDonationListBybookIdAndMemberIdAndStatus(Long bookId, Long memberId, DonationStatus donationStatus);
}
