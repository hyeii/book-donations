package com.bookdone.history.controller;

import com.bookdone.global.dto.BaseResponse;
import com.bookdone.history.application.AddHistoryUseCase;
import com.bookdone.history.application.FindHistoryUseCase;
import com.bookdone.history.dto.request.HistoryAddRequest;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/histories")
public class HistoryController {
    private final AddHistoryUseCase addHistoryUseCase;
    private final FindHistoryUseCase findHistoryUseCase;

    @GetMapping("/donations/{donationId}")
    public ResponseEntity<?> historyList(@PathVariable Long donationId) {
        return BaseResponse.okWithData(HttpStatus.OK, "히스토리 목록 조회 완료", findHistoryUseCase.findAll(donationId));
    }

    @GetMapping("/donations/{donationId}/members")
    public ResponseEntity<?> historyDetailsByDonationIdAndMemberId(@PathVariable Long donationId, @RequestHeader("member-id") Long memberId) {
        return BaseResponse.okWithData(HttpStatus.OK, "히스토리 조회 완료", findHistoryUseCase.findHistoryByDonationIdAndMemberId(donationId, memberId));
    }

    @GetMapping("/{historyId}")
    public ResponseEntity<?> historyDetailsById(@PathVariable Long historyId) throws JsonProcessingException {
        return BaseResponse.okWithData(HttpStatus.OK, "히스토리 조회 완료", findHistoryUseCase.findHistoryById(historyId));
    }

    @PatchMapping("/donations/{donationId}")
    public ResponseEntity<?> addHistory(
            @RequestHeader("member-id") Long memberId, @PathVariable Long donationId, @RequestBody HistoryAddRequest historyAddRequest) {
        historyAddRequest.setMemberId(memberId);
        historyAddRequest.setDonationId(donationId);
        return BaseResponse.okWithData(HttpStatus.CREATED, "히스토리 작성 완료", addHistoryUseCase.updateHistory(historyAddRequest));
    }
}
