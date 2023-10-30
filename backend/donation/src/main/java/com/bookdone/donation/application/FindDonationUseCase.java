package com.bookdone.donation.application;

import com.bookdone.client.api.MemberClient;
import com.bookdone.client.dto.MemberResponse;
import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.dto.response.DonationDetailsResponse;
import com.bookdone.donation.dto.response.DonationListResponse;
import com.bookdone.util.ResponseUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import feign.FeignException;
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
    private final MemberClient memberClient;
    private final ResponseUtil responseUtil;

    public List<DonationListResponse> findDonationList(Long isbn, Integer address) throws JsonProcessingException {
        List<Donation> donationList = donationRepository.findAllByIsbnAndAddress(isbn, address);

        if(donationList.isEmpty()) return null;

        List<Long> memberIdList = donationList.stream()
                .map(donation -> donation.getMemberId())
                .collect(Collectors.toList());

        Map<Long, MemberResponse> memberResponseMap = null;
        try {
            memberResponseMap = responseUtil.extractDataFromResponse(memberClient.getMemberInfoList(memberIdList), Map.class);
        } catch (FeignException.NotFound e) {
            throw e;
        }

        List<DonationListResponse> donationListResponseList = createDonationListResponse(donationList, memberResponseMap);

        return donationListResponseList;
    }

    public DonationDetailsResponse findDonation(Long id) throws JsonProcessingException {
        Donation donation = donationRepository.findById(id);

        MemberResponse memberResponse = null;

        //todo nickname
        try {
            memberResponse = responseUtil.extractDataFromResponse(memberClient.getMemberInfo(donation.getMemberId()), MemberResponse.class);
        } catch (FeignException.NotFound e) {
            throw e;
        }

        //todo imageUrlList
        List<String> imageUrlList = null;

        return DonationDetailsResponse
                .builder()
                .id(donation.getId())
                .isbn(donation.getIsbn())
                .nickname(memberResponse.getNickname())
                .address(donation.getAddress())
                .content(donation.getContent())
                .canDelivery(donation.isCanDelivery())
                .imageUrlList(imageUrlList)
                .build();
    }

    public List<DonationListResponse> createDonationListResponse(List<Donation> donationList, Map<Long, MemberResponse> memberResponseMap) {
        List<DonationListResponse> donationListResponseList = new ArrayList<>();

        //todo historyCount
        Map<Long, Integer> historyCountMap = null;

        for(Donation donation : donationList) {
            DonationListResponse donationListResponse = DonationListResponse
                    .builder()
                    .id(donation.getId())
                    .nickname(memberResponseMap.get(donation.getId()).getNickname())
                    .historyCount(historyCountMap.get(donation.getId()))
                    .address(donation.getAddress())
                    .createdAt(donation.getCreatedAt())
                    .build();
            donationListResponseList.add(donationListResponse);
        }

        return donationListResponseList;
    }

}
