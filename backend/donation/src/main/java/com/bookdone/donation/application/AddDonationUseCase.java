package com.bookdone.donation.application;

import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.dto.request.DonationAddRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class AddDonationUseCase {

    private final DonationRepository donationRepository;

    public Long addDonation(DonationAddRequest donationAddRequest) {
        //todo images s3로 저장

        Donation donation = donationAddRequest.toDomain();

        Long id = donationRepository.save(donation);
        return id;
    }

    public Long readdDonation(DonationAddRequest donationAddRequest) {
        //todo images s3로 저장

        Donation donation = donationAddRequest.toDomain();

        Long id = donationRepository.update(donation);
        return id;
    }

}
