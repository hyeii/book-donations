package com.bookdone.history.application;

import com.bookdone.client.api.MemberClient;
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

        String nickname = null;

        try {
            nickname = responseUtil.extractDataFromResponse(
                    memberClient.getNickname(history.getMemberId()), String.class);
        } catch (FeignException.NotFound e) {
            throw e;
        }

        return HistoryResponse.builder()
                .content(history.getContent())
                .createdAt(history.getCreatedAt())
                .nickname(nickname)
                .build();
    }

    public HistoryResponse findHistoryByDonationIdAndMemberId(Long donationId, Long memberId) {
        History history = historyRepository.findByDonationIdAndMemberId(donationId, memberId);

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
                .build();
    }

    public List<HistoryResponse> findAll(Long donationId) {
        List<History> historyList = historyRepository.findAllByDonationId(donationId);

        List<Long> memberIdList = historyList.stream()
                .map(history -> history.getMemberId())
                .collect(Collectors.toList());

        Map<Long, String> nicknameMap = null;
        try {
            nicknameMap = responseUtil.extractDataFromResponse(memberClient.getNicknameList(memberIdList), Map.class);
        } catch (FeignException.NotFound e) {
            throw e;
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

        List<HistoryResponse> historyResponseList = createHistoryResponseList(historyList, nicknameMap);
        return historyResponseList;
    }

    public List<HistoryResponse> createHistoryResponseList(
            List<History> historyList, Map<Long, String> nicknameMap) {
        List<HistoryResponse> historyResponseList = new ArrayList<>();

        for(History history : historyList) {
            HistoryResponse historyResponse = HistoryResponse.builder()
                    .content(history.getContent())
                    .createdAt(history.getCreatedAt())
                    .nickname(nicknameMap.get(history.getMemberId()))
                    .build();
            historyResponseList.add(historyResponse);
        }

        return historyResponseList;
    }

}
