package com.bookdone.donation.application;

import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class ModifyDonationUseCase {
    private final DonationRepository donationRepository;

    public Long changeStatusToKeeping(Long id) {
        //todo 예외처리
        Donation donation = donationRepository.findById(id);

        //todo 예외처리
        if(donation.getStatus() == DonationStatus.KEEPING)
            throw new IllegalArgumentException("이미 보유중인 책입니다.");

        donation.changeStatusToKeeping();
        id = donationRepository.save(donation);

        return id;
    }
}
