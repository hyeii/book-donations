package com.bookdone.donation.infra.database;

import com.bookdone.donation.application.DonationStatus;
import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.infra.entity.DonationEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class DonationRepositoryImpl implements DonationRepository {
    private final JpaDonationRepository jpaDonationRepository;

    @Override
    public Long save(Donation donation) {
        DonationEntity donationEntity = DonationEntity.fromDomain(donation);
        donationEntity = jpaDonationRepository.save(donationEntity);
        return donationEntity.getId();
    }

    @Override
    public List<DonationEntity> findDonationListBybookIdAndMemberIdAndStatus(Long bookId, Long memberId, DonationStatus donationStatus) {
        return jpaDonationRepository.findDonationEntitiesByBookIdAndMemberIdAndStatus(bookId, memberId, donationStatus.getStatusCode());
    }
}
