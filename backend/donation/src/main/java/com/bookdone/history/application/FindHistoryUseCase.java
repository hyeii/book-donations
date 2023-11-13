package com.bookdone.history.application;

import com.bookdone.client.api.BookClient;
import com.bookdone.client.api.MemberClient;
import com.bookdone.client.dto.BookResponse;
import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.history.application.repository.HistoryRepository;
import com.bookdone.history.domain.History;
import com.bookdone.history.dto.response.HistoryResponse;
import com.bookdone.util.ResponseUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
@Transactional
@RequiredArgsConstructor
public class FindHistoryUseCase {
    private final HistoryRepository historyRepository;
    private final MemberClient memberClient;
    private final ResponseUtil responseUtil;
    private final DonationRepository donationRepository;
    private final BookClient bookClient;


    public HistoryResponse findHistoryById(Long id) throws JsonProcessingException {
        History history = historyRepository.findById(id);
        Donation donation = donationRepository.findById(history.getDonationId());
        BookResponse bookResponse = responseUtil.extractDataFromResponse(
                bookClient.getBookInfo(donation.getIsbn()), BookResponse.class);

        String nickname = null;

        try {
            nickname = responseUtil.extractDataFromResponse(
                    memberClient.getNickname(history.getMemberId()), String.class);
        } catch (FeignException.NotFound e) {
            throw e;
        }

        return HistoryResponse.builder()
                .content(history.getContent())
                .titleUrl(bookResponse.getTitleUrl())
                .title(bookResponse.getTitle())
                .createdAt(history.getCreatedAt())
                .nickname(nickname)
                .build();
    }

    public List<HistoryResponse> findMyUnwrittenHistories(Long memberId) throws JsonProcessingException {
        List<History> historyList = historyRepository.findAllUnwrittenByMemberId(memberId);
        if(historyList.isEmpty()) return new ArrayList<HistoryResponse>();

        String nickname = responseUtil.extractDataFromResponse(memberClient.getNickname(memberId), String.class);
        List<String> isbnList = historyList.stream()
                .map(history -> donationRepository.findById(history.getDonationId()).getIsbn())
                .collect(Collectors.toList());

        Map<String, BookResponse> bookResponseMap = responseUtil
                .extractDataFromResponse(bookClient.getBookInfoList(isbnList), Map.class);

        Map<Long, String> donationMap = new HashMap<>();

        for(int idx = 0; idx < isbnList.size(); idx++) {
            donationMap.put(historyList.get(idx).getDonationId(), isbnList.get(idx));
        }

        List<HistoryResponse> historyResponseList = historyList.stream().map(history -> {
            String isbn = donationMap.get(history.getDonationId());
            ObjectMapper objectMapper = new ObjectMapper();
            BookResponse bookResponse = objectMapper.convertValue(
                    bookResponseMap.get(isbn), BookResponse.class);

            return HistoryResponse.builder()
                    .content(history.getContent())
                    .createdAt(history.getCreatedAt())
                    .nickname(nickname)
                    .title(bookResponse.getTitle())
                    .titleUrl(bookResponse.getTitleUrl())
                    .build();
        }).collect(Collectors.toList());

        return historyResponseList;
    }

    public List<HistoryResponse> findMyWrittenHistories(Long memberId) throws JsonProcessingException {
        List<History> historyList = historyRepository.findAllWrittenByMemberId(memberId);
        if(historyList.isEmpty()) return new ArrayList<HistoryResponse>();

        String nickname = responseUtil.extractDataFromResponse(memberClient.getNickname(memberId), String.class);
        List<String> isbnList = historyList.stream()
                .map(history -> donationRepository.findById(history.getDonationId()).getIsbn())
                .collect(Collectors.toList());

        Map<String, BookResponse> bookResponseMap = responseUtil
                .extractDataFromResponse(bookClient.getBookInfoList(isbnList), Map.class);

        Map<Long, String> donationMap = new HashMap<>();

        for(int idx = 0; idx < isbnList.size(); idx++) {
            donationMap.put(historyList.get(idx).getDonationId(), isbnList.get(idx));
        }

        List<HistoryResponse> historyResponseList = historyList.stream().map(history -> {
            String isbn = donationMap.get(history.getDonationId());
            ObjectMapper objectMapper = new ObjectMapper();
            BookResponse bookResponse = objectMapper.convertValue(
                    bookResponseMap.get(isbn), BookResponse.class);

            return HistoryResponse.builder()
                    .content(history.getContent())
                    .createdAt(history.getCreatedAt())
                    .nickname(nickname)
                    .title(bookResponse.getTitle())
                    .titleUrl(bookResponse.getTitleUrl())
                    .build();
        }).collect(Collectors.toList());

        return historyResponseList;
    }

    public HistoryResponse findHistoryByDonationIdAndMemberId(
            Long donationId, Long memberId) throws JsonProcessingException {
        History history = historyRepository.findByDonationIdAndMemberId(donationId, memberId);
        Donation donation = donationRepository.findById(donationId);
        BookResponse bookResponse = responseUtil.extractDataFromResponse(
                bookClient.getBookInfo(donation.getIsbn()), BookResponse.class);

        String nickname = null;

        try {
            nickname = responseUtil.extractDataFromResponse(
                    memberClient.getNickname(history.getMemberId()), String.class);
        } catch (FeignException.NotFound e) {
            throw e;
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

        return HistoryResponse.builder()
                .content(history.getContent())
                .createdAt(history.getCreatedAt())
                .nickname(nickname)
                .title(bookResponse.getTitle())
                .titleUrl(bookResponse.getTitleUrl())
                .build();
    }

    public List<HistoryResponse> findAll(Long donationId) {
        List<History> historyList = historyRepository.findAllByDonationId(donationId);
        if(historyList.isEmpty()) return new ArrayList<HistoryResponse>();

        List<Long> memberIdList = historyList.stream()
                .map(history -> history.getMemberId())
                .collect(Collectors.toList());
        Donation donation = donationRepository.findById(donationId);
        BookResponse bookResponse = null;
        Map<String, String> nicknameMap = null;
        try {
            nicknameMap = responseUtil.extractDataFromResponse(memberClient.getNicknameList(memberIdList), Map.class);
            bookResponse = responseUtil.extractDataFromResponse(
                    bookClient.getBookInfo(donation.getIsbn()), BookResponse.class);
        } catch (FeignException.NotFound e) {
            throw e;
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

        List<HistoryResponse> historyResponseList = createHistoryResponseList(historyList, nicknameMap, bookResponse);
        return historyResponseList;
    }

    public List<HistoryResponse> createHistoryResponseList(
            List<History> historyList, Map<String, String> nicknameMap, BookResponse bookResponse) {
        List<HistoryResponse> historyResponseList = new ArrayList<>();

        for(History history : historyList) {
            HistoryResponse historyResponse = HistoryResponse.builder()
                    .content(history.getContent())
                    .createdAt(history.getCreatedAt())
                    .nickname(nicknameMap.get(String.valueOf(history.getMemberId())))
                    .titleUrl(bookResponse.getTitleUrl())
                    .title(bookResponse.getTitle())
                    .build();
            historyResponseList.add(historyResponse);
        }

        return historyResponseList;
    }

}
