package com.bookdone.donation.infra.database;

import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.infra.entity.DonationEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;

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
    public Donation findById(Long id) {
        DonationEntity donationEntity = jpaDonationRepository.findById(id)
                .orElseThrow();
        return Donation.createDonation(donationEntity);
    }

    @Override
    public List<Donation> findAllByIsbnAndAddress(Long isbn, Integer address) {
        List<DonationEntity> donationEntityList = jpaDonationRepository.findAllByIsbnAndAddress(isbn, address);
        return donationEntityList.stream().map(Donation::createDonation).collect(Collectors.toList());
    }

}
