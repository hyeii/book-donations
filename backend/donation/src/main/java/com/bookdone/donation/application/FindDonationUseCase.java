package com.bookdone.donation.application;

import com.bookdone.client.api.MemberClient;
import com.bookdone.client.dto.MemberResponse;
import com.bookdone.donation.application.repository.DonationImageRepository;
import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.dto.response.DonationDetailsResponse;
import com.bookdone.donation.dto.response.DonationListResponse;
import com.bookdone.history.application.repository.HistoryRepository;
import com.bookdone.history.domain.History;
import com.bookdone.history.dto.response.HistoryResponse;
import com.bookdone.util.ResponseUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import feign.FeignException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class FindDonationUseCase {

    private final DonationRepository donationRepository;
    private final HistoryRepository historyRepository;
    private final DonationImageRepository donationImageRepository;
    private final MemberClient memberClient;
    private final ResponseUtil responseUtil;

    public List<DonationListResponse> findDonationList(Long isbn, Integer address) throws JsonProcessingException {
        List<Donation> donationList = donationRepository.findAllByIsbnAndAddress(isbn, address);

        if (donationList.isEmpty()) return null;

        List<Long> memberIdList = donationList.stream()
                .map(donation -> donation.getMemberId())
                .collect(Collectors.toList());

        Map<Long, MemberResponse> memberResponseMap = null;

        try {
            memberResponseMap = responseUtil.extractDataFromResponse(memberClient.getMemberInfoList(memberIdList), Map.class);
        } catch (FeignException.NotFound e) {
            throw e;
        }

//        memberResponseMap = new HashMap<>();
//        memberResponseMap.put(1L, new MemberResponse(1L, "1", "abc", "address", 1,"email", "image"));
//        memberResponseMap.put(2L, new MemberResponse(2L, "2", "abcd", "address2", 1,"email2", "image2"));

        List<DonationListResponse> donationListResponseList = createDonationListResponse(
                donationList, memberResponseMap);

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

//        memberResponse = new MemberResponse(
//                1L, "1", "abc", "address", 1,"email", "image");

        //todo imageUrlList
        List<String> imageUrlList = donationImageRepository.findImageUrlList(id);

        List<History> historyList = historyRepository.findAll(id);
        List<Long> memberIdList = historyList.stream()
                .map(history -> history.getMemberId()).collect(Collectors.toList());

        Map<Long, MemberResponse> memberResponseMap = null;
        try {
            memberResponseMap = responseUtil.extractDataFromResponse(memberClient.getMemberInfoList(memberIdList), Map.class);
        } catch (FeignException.NotFound e) {
            throw e;
        }
//        memberResponseMap = new HashMap<>();
//        memberResponseMap.put(1L, new MemberResponse(1L, "1", "abc", "address", 1,"email", "image"));
//        memberResponseMap.put(2L, new MemberResponse(2L, "2", "abcd", "address2", 1,"email2", "image2"));

        return createDonationResponse(donation, imageUrlList, memberResponseMap, historyList, memberResponse);
    }

    public List<DonationListResponse> createDonationListResponse(List<Donation> donationList, Map<Long, MemberResponse> memberResponseMap) {
        List<DonationListResponse> donationListResponseList = new ArrayList<>();

        for (Donation donation : donationList) {
            DonationListResponse donationListResponse = DonationListResponse
                    .builder()
                    .id(donation.getId())
                    .nickname(memberResponseMap.get(donation.getId()).getNickname())
                    .historyCount(historyRepository.countAllByDonationId(donation.getId()))
                    .address(donation.getAddress())
                    .createdAt(donation.getCreatedAt())
                    .build();
            donationListResponseList.add(donationListResponse);
        }

        return donationListResponseList;
    }

    public DonationDetailsResponse createDonationResponse(
            Donation donation,
            List<String> imageUrlList,
            Map<Long, MemberResponse> memberResponseMap,
            List<History> historyList,
            MemberResponse memberResponse) {

        List<HistoryResponse> historyResponseList = historyList.stream().map(history -> HistoryResponse.builder()
                .content(history.getContent())
                .nickname(memberResponseMap.get(history.getMemberId()).getNickname())
                .createdAt(history.getCreatedAt())
                .build()).collect(Collectors.toList());

        return DonationDetailsResponse.builder()
                .id(donation.getId())
                .isbn(donation.getIsbn())
                .nickname(memberResponse.getNickname())
                .address(donation.getAddress())
                .content(donation.getContent())
                .canDelivery(donation.isCanDelivery())
                .historyResponseList(historyResponseList)
                .imageUrlList(imageUrlList)
                .build();
    }

}
