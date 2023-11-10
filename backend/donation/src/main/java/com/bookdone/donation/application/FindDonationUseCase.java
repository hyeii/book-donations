package com.bookdone.donation.application;

import com.bookdone.client.api.BookClient;
import com.bookdone.client.api.MemberClient;
import com.bookdone.client.dto.BookDto;
import com.bookdone.donation.application.repository.DonationImageRepository;
import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.dto.response.DonationCountResponse;
import com.bookdone.donation.dto.response.DonationDetailsResponse;
import com.bookdone.donation.dto.response.DonationListResponse;
import com.bookdone.donation.dto.response.DonationMyPageResponse;
import com.bookdone.history.application.repository.HistoryRepository;
import com.bookdone.history.domain.History;
import com.bookdone.history.dto.response.HistoryResponse;
import com.bookdone.util.ResponseUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import feign.FeignException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
@Slf4j
public class FindDonationUseCase {

    private final DonationRepository donationRepository;
    private final HistoryRepository historyRepository;
    private final DonationImageRepository donationImageRepository;
    private final MemberClient memberClient;
    private final ResponseUtil responseUtil;
    private final BookClient bookClient;

    public List<DonationListResponse> findDonationList(String isbn, String address) throws JsonProcessingException {
        List<Donation> donationList = null;
        if(address.substring(2, 4).equals("00"))
            donationList = donationRepository.findAllAddressByIsbnAndAddress(isbn, address);
        else
            donationList = donationRepository.findAllByIsbnAndAddress(isbn, address);

        if (donationList.isEmpty()) return null;

        List<Long> memberIdList = donationList.stream()
                .map(donation -> donation.getMemberId())
                .collect(Collectors.toList());

        Map<Long, String> nicknameMap = null;

        try {
            nicknameMap = responseUtil.extractDataFromResponse(memberClient.getNicknameList(memberIdList), HashMap.class);
        } catch (FeignException.NotFound e) {
            throw e;
        }

        log.info("nicknameMap type = {}", nicknameMap.getClass());
        for (Map.Entry<Long, String> entry : nicknameMap.entrySet()) {
            log.info("key type = {}, value type = {}", entry.getKey().getClass(), entry.getValue().getClass());
        }

        List<DonationListResponse> donationListResponseList = createDonationListResponse(
                donationList, nicknameMap);

        return donationListResponseList;
    }

    public List<DonationListResponse> createDonationListResponse(List<Donation> donationList, Map<Long, String> nicknameMap) {
        List<DonationListResponse> donationListResponseList = new ArrayList<>();

        log.info("nicknameMap={}", nicknameMap);
        log.info("map values = {}", nicknameMap.values());
        log.info("map keys = {}", nicknameMap.keySet());

        ObjectMapper objectMapper = new ObjectMapper();


        for (Donation donation : donationList) {
//            String nickname = objectMapper.convertValue(nicknameMap.get(donation.getMemberId()), String.class);
            String nickname = nicknameMap.get(donation.getMemberId());
            log.info("id={}", donation.getMemberId());
            log.info("nickname={}", nickname);
            log.info("nickname2={}", nicknameMap.get(donation.getMemberId()));

            DonationListResponse donationListResponse = DonationListResponse
                    .builder()
                    .id(donation.getId())
                    .nickname(nickname)
                    .historyCount(historyRepository.countAllByDonationId(donation.getId()))
                    .address(donation.getAddress())
                    .createdAt(donation.getCreatedAt())
                    .build();
            donationListResponseList.add(donationListResponse);
        }

        return donationListResponseList;
    }

    public DonationDetailsResponse findDonation(Long id) throws JsonProcessingException {
        Donation donation = donationRepository.findById(id);

        String nickname = null;

        try {
            nickname = responseUtil.extractDataFromResponse(memberClient.getNickname(donation.getMemberId()),String.class);
        } catch (FeignException.NotFound e) {
            throw e;
        }

        List<String> imageUrlList = donationImageRepository.findImageUrlList(id);

        List<History> historyList = historyRepository.findAllByDonationId(id);
        List<Long> memberIdList = historyList.stream()
                .map(history -> history.getMemberId()).collect(Collectors.toList());

        Map<Long, String> nicknameMap = null;
        try {
            nicknameMap = responseUtil.extractDataFromResponse(memberClient.getNicknameList(memberIdList), Map.class);
        } catch (FeignException.NotFound e) {
            throw e;
        }

        return createDonationResponse(donation, imageUrlList, nicknameMap, historyList, nickname);
    }

    public DonationDetailsResponse createDonationResponse(
            Donation donation,
            List<String> imageUrlList,
            Map<Long, String> nicknameMap,
            List<History> historyList,
            String nickname) {

        List<HistoryResponse> historyResponseList = historyList.stream().map(history -> HistoryResponse.builder()
                .content(history.getContent())
                .nickname(nicknameMap.get(history.getMemberId()))
                .createdAt(history.getCreatedAt())
                .build()).collect(Collectors.toList());

        return DonationDetailsResponse.builder()
                .id(donation.getId())
                .isbn(donation.getIsbn())
                .nickname(nickname)
                .address(donation.getAddress())
                .content(donation.getContent())
                .canDelivery(donation.isCanDelivery())
                .historyResponseList(historyResponseList)
                .imageUrlList(imageUrlList)
                .build();
    }

    public List<DonationMyPageResponse> findDonationListByMember(Long memberId) {
        List<Donation> donationList = donationRepository.findAllByMemberId(memberId);

        Map<String, BookDto> bookResponseMap = null;

        List<String> isbnList = donationList.stream().map(donation -> donation.getIsbn())
                .collect(Collectors.toList());

        try {
            bookResponseMap = responseUtil.extractDataFromResponse(bookClient.getBookInfoList(isbnList), Map.class);
        } catch (FeignException.NotFound e) {
            throw e;
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

        return createDonationMyPageResponse(donationList, bookResponseMap);
    }

    public List<DonationMyPageResponse> createDonationMyPageResponse(List<Donation> donationList, Map<String, BookDto> bookResponseMap) {
        List<DonationMyPageResponse> donationMyPageResponseList = donationList.stream().map(donation -> {

            List<History> historyList = historyRepository.findAllByDonationId(donation.getId());
            List<Long> memberIdList = historyList.stream().map(history -> history.getMemberId())
                    .collect(Collectors.toList());

            List<HistoryResponse> historyResponseList = null;

            try {
                Map<Long, String> nicknameMap = responseUtil.extractDataFromResponse(memberClient.getNicknameList(memberIdList), Map.class);
                historyResponseList = historyList.stream().map(history -> HistoryResponse.builder()
                        .content(history.getContent())
                        .nickname(nicknameMap.get(history.getMemberId()))
                        .createdAt(history.getCreatedAt())
                        .build()).collect(Collectors.toList());
            } catch (FeignException.NotFound e) {
                throw e;
            } catch (JsonProcessingException e) {
                throw new RuntimeException(e);
            }

            History lastHistory = historyRepository.findLastHistoryByDonationId(donation.getId());
            ObjectMapper objectMapper = new ObjectMapper();
            BookDto bookDto = objectMapper.convertValue(bookResponseMap.get(donation.getIsbn()), BookDto.class);

            return DonationMyPageResponse.builder()
                    .donationStatus(donation.getStatus())
                    .id(donation.getId())
                    .title(bookDto.getTitle())
                    .titleUrl(bookDto.getTitleUrl())
                    .historyResponseList(historyResponseList)
                    .donatedAt(lastHistory == null ? donation.getCreatedAt() : lastHistory.getDonatedAt())
                    .build();
        }).collect(Collectors.toList());

        return donationMyPageResponseList;
    }

    public List<DonationCountResponse> countDonationCount(String isbn, String address) {
        return donationRepository.countAllByIsbnAndAddress(isbn, address);
    }
}
