package com.bookdone.donation.application;


import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.dto.request.DonationAddRequest;
import com.bookdone.donation.infra.entity.DonationEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class AddDonationUseCase {

    private final DonationRepository donationRepository;

    public Long addDonation(DonationAddRequest donationAddRequest) {
        //todo bookId 유효성 검사
        //todo memberId 유효성 검사
        //유효성 검사를 중복으로?

        //todo status 확인 ?
        //todo images s3로 저장

        Donation donation = donationAddRequest.toDomain();

        Long id = donationRepository.save(donation);

        return id;
    }

    public boolean isDuplicated(DonationAddRequest donationAddRequest) {
        //todo bookId 유효성 검사
        //todo memberId 유효성 검사
        List<DonationEntity> donationEntityList = donationRepository.findDonationListBybookIdAndMemberIdAndStatus(donationAddRequest.getBookId(),
                donationAddRequest.getMemberId(), DonationStatus.KEEPING);
        if(donationEntityList.size() != 0) return true;
        return false;
    }

}
