package com.bookdone.donation.infra.database;

import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.dto.response.DonationCountResponse;
import com.bookdone.donation.infra.entity.DonationEntity;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
@Slf4j
public class DonationRepositoryImpl implements DonationRepository {
    private final JpaDonationRepository jpaDonationRepository;

    @Override
    public Long save(Donation donation) {
        DonationEntity donationEntity = donation.createEntity();
        return jpaDonationRepository.save(donationEntity).getId();
    }

    @Override
    public Long update(Donation donation) {
        DonationEntity donationEntity = donation.createEntity();
        log.info("donationEntity={}", donationEntity.toString());
        donationEntity.updateCreatedAt(LocalDateTime.now());
        jpaDonationRepository.findById(donationEntity.getId())
                .orElseThrow(() -> new IllegalArgumentException("해당 도네이션이 없습니다."));
        return jpaDonationRepository.save(donationEntity).getId();
    }

    @Override
    public Donation findById(Long id) {
        DonationEntity donationEntity = jpaDonationRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 도네이션이 없습니다."));
        return Donation.createDonation(donationEntity);
    }

    @Override
    public List<Donation> findAllByMemberId(Long memberId) {
        List<DonationEntity> donationEntityList = jpaDonationRepository.findAllByMemberId(memberId);
        return donationEntityList.stream().map(Donation::createDonation).collect(Collectors.toList());
    }

    @Override
    public List<Donation> findAllByIsbnAndAddress(String isbn, String address) {
        List<DonationEntity> donationEntityList = jpaDonationRepository.findAllByIsbnAndAddress(isbn, address);
        return donationEntityList.stream().map(Donation::createDonation).collect(Collectors.toList());
    }

    @Override
    public List<DonationCountResponse> countAllByIsbnAndAddress(String isbn, String address) {
        return jpaDonationRepository.countAllByIsbnAndAddress(isbn, address.substring(0 , 2));
    }

    @Override
    public List<Donation> findAllAddressByIsbnAndAddress(String isbn, String address) {
        List<DonationEntity> donationEntityList = jpaDonationRepository
                .findAllAddressByIsbnAndAddress(isbn, address.substring(0, 2));
        return donationEntityList.stream().map(Donation::createDonation).collect(Collectors.toList());
    }

}
