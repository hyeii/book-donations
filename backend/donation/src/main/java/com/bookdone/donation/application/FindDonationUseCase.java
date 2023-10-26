package com.bookdone.donation.application;

import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.dto.response.DonationDetailsResponse;
import com.bookdone.donation.dto.response.DonationListResponse;
import com.bookdone.donation.infra.entity.DonationEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class FindDonationUseCase {

    private final DonationRepository donationRepository;

    public List<DonationListResponse> findDonationList(Long isbn, Integer address) {
        //todo isbn 유효성 검사

        List<DonationEntity> donationEntityList = donationRepository.findAllByIsbnAndAddress(isbn, address);
        List<Donation> donationList = donationEntityList
                .stream()
                .map(Donation::createDonation)
                .collect(Collectors.toList());
        List<DonationListResponse> donationListResponseList = createDonationListResponse(donationList);

        return donationListResponseList;
    }

    public DonationDetailsResponse findDonation(Long id) {
        //todo 예외처리
        DonationEntity donationEntity = donationRepository.findById(id).orElseThrow();

        //todo nickname
        String nickname = null;

        //todo immageUrlList
        List<String> imageUrlList = null;

        DonationDetailsResponse donationDetailsResponse = DonationDetailsResponse
                .builder()
                .id(donationEntity.getId())
                .isbn(donationEntity.getIsbn())
                .nickname(nickname)
                .address(donationEntity.getAddress())
                .content(donationEntity.getContent())
                .canDelivery(donationEntity.isCanDelivery())
                .imageUrlList(imageUrlList)
                .build();

        return donationDetailsResponse;
    }

    public List<DonationListResponse> createDonationListResponse(List<Donation> donationList) {
        List<DonationListResponse> donationListResponseList = new ArrayList<>();

        //todo nickname
        Map<Long, String> nicknameMap = null;

        //todo historyCount
        Map<Long, Integer> hisoryCountMap = null;

        for(Donation donation : donationList) {
            DonationListResponse donationListResponse = DonationListResponse
                    .builder()
                    .id(donation.getId())
                    .nickname(nicknameMap.get(donation.getId()))
                    .historyCount(hisoryCountMap.get(donation.getId()))
                    .address(donation.getAddress())
                    .createdAt(donation.getCreatedAt())
                    .build();
            donationListResponseList.add(donationListResponse);
        }

        return donationListResponseList;
    }

}
