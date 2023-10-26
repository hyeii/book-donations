package com.bookdone.donation.infra.database;

import com.bookdone.donation.application.DonationStatus;
import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.infra.entity.DonationEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class DonationRepositoryImpl implements DonationRepository {
    private final JpaDonationRepository jpaDonationRepository;

    @Override
    public Long save(Donation donation) {
        DonationEntity donationEntity = donation.createEntity();
        return jpaDonationRepository.save(donationEntity).getId();
    }

    @Override
    public Optional<DonationEntity> findById(Long id) {
        return jpaDonationRepository.findById(id);
    }

    @Override
    public List<DonationEntity> findAllByIsbnAndAddress(Long isbn, Integer address) {
        return jpaDonationRepository.findAllByIsbnAndAddress(isbn, address);
    }

    @Override
    public List<DonationEntity> findAllBybookIdAndMemberIdAndStatus(Long bookId, Long memberId, DonationStatus donationStatus) {
        return jpaDonationRepository.findDonationEntitiesByBookIdAndMemberIdAndStatus(bookId, memberId, donationStatus);
    }


}
