package com.bookdone.history.application;

import com.bookdone.client.api.MemberClient;
import com.bookdone.client.dto.MemberResponse;
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

    public HistoryResponse findHistoryById(Long id) throws JsonProcessingException {
        History history = historyRepository.findById(id);

        MemberResponse memberResponse = null;

        try {
            memberResponse = responseUtil.extractDataFromResponse(
                    memberClient.getMemberInfo(history.getMemberId()), MemberResponse.class);
        } catch (FeignException.NotFound e) {
            throw e;
        }

        return HistoryResponse.builder()
                .content(history.getContent())
                .createdAt(history.getCreatedAt())
                .nickname(memberResponse.getNickname())
                .build();
    }

    public HistoryResponse findHistoryByDonationIdAndMemberId(Long donationId, Long memberId) {
        History history = historyRepository.findByDonationIdAndMemberId(donationId, memberId);

        MemberResponse memberResponse = null;

        try {
            memberResponse = responseUtil.extractDataFromResponse(
                    memberClient.getMemberInfo(history.getMemberId()), MemberResponse.class);
        } catch (FeignException.NotFound e) {
            throw e;
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

        return HistoryResponse.builder()
                .content(history.getContent())
                .createdAt(history.getCreatedAt())
                .nickname(memberResponse.getNickname())
                .build();
    }

    public List<HistoryResponse> findAll(Long donationId) {
        List<History> historyList = historyRepository.findAll(donationId);

        List<Long> memberIdList = historyList.stream()
                .map(history -> history.getMemberId())
                .collect(Collectors.toList());

        Map<Long, MemberResponse> memberResponseMap = null;
        try {
            memberResponseMap = responseUtil.extractDataFromResponse(memberClient.getMemberInfoList(memberIdList), Map.class);
        } catch (FeignException.NotFound e) {
            throw e;
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

        List<HistoryResponse> historyResponseList = createHistoryResponseList(historyList, memberResponseMap);
        return historyResponseList;
    }

    public List<HistoryResponse> createHistoryResponseList(
            List<History> historyList, Map<Long, MemberResponse> memberResponseMap) {
        List<HistoryResponse> historyResponseList = new ArrayList<>();

        for(History history : historyList) {
            HistoryResponse historyResponse = HistoryResponse.builder()
                    .content(history.getContent())
                    .createdAt(history.getCreatedAt())
                    .nickname(memberResponseMap.get(history.getMemberId()).getNickname())
                    .build();
            historyResponseList.add(historyResponse);
        }

        return historyResponseList;
    }

}
