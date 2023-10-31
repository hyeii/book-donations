package com.bookdone.donation.application;

import com.bookdone.donation.application.repository.DonationImageRepository;
import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.dto.request.DonationAddRequest;
import com.bookdone.trade.application.repository.TradeRepository;
import com.bookdone.util.S3Uploader;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class AddDonationUseCase {

    private final DonationRepository donationRepository;
    private final DonationImageRepository donationImageRepository;
    private final TradeRepository tradeRepository;

    public Long addDonation(DonationAddRequest donationAddRequest) {
        //todo images s3로 저장
        Donation donation = donationAddRequest.toDomain();
        Long id = donationRepository.save(donation);

        donationImageRepository.saveImageList(id, donationAddRequest.getImages());
        tradeRepository.addTrade(id, donationAddRequest.getMemberId());
        return id;
    }

    public Long readdDonation(DonationAddRequest donationAddRequest) {
        //todo images s3로 저장

        Donation donation = donationAddRequest.toDomain();
        Long id = donationRepository.update(donation);

        donationImageRepository.saveImageList(id, donationAddRequest.getImages());
        tradeRepository.addTrade(id, donationAddRequest.getMemberId());
        return id;
    }

}
