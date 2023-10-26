package com.bookdone.donation.application.repository;

import com.bookdone.donation.application.DonationStatus;
import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.infra.entity.DonationEntity;

import java.util.List;
import java.util.Optional;

public interface DonationRepository {

    public Long save(Donation donation);

    public Optional<DonationEntity> findById(Long id);

    public List<DonationEntity> findAllByIsbnAndAddress(Long isbn, Integer address);

    public List<DonationEntity> findAllBybookIdAndMemberIdAndStatus(Long bookId, Long memberId, DonationStatus donationStatus);
}
