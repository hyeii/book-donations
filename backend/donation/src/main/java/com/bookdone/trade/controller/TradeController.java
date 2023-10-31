package com.bookdone.trade.controller;

import com.bookdone.global.dto.BaseResponse;
import com.bookdone.trade.application.ModifyTradeUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/trades/donations")
public class TradeController {

    private final ModifyTradeUseCase modifyTradeUseCase;

    @PatchMapping("/{donationId}/members/{memberId}/reservations/request")
    public ResponseEntity<?> donationChangeIntoDonationRequested(@PathVariable Long donationId, @PathVariable Long memberId) {
        modifyTradeUseCase.changeStatusToDonationRequested(donationId, memberId);
        return BaseResponse.ok(HttpStatus.OK, "거래 상태가 변경되었습니다.");
    }

    @PatchMapping("/{donationId}/members/{memberId}/reservations/confirm")
    public ResponseEntity<?> donationChangeIntoDonationConfirmed(@PathVariable Long donationId, @PathVariable Long memberId) {
        modifyTradeUseCase.changeStatusToDonationConfirmed(donationId, memberId);
        return BaseResponse.ok(HttpStatus.OK, "거래 상태가 변경되었습니다.");
    }

    @PatchMapping("/{donationId}/members/{memberId}/completion/request")
    public ResponseEntity<?> donationChangeIntoCompletionRequested(@PathVariable Long donationId, @PathVariable Long memberId) {
        modifyTradeUseCase.changeStatusToCompletionRequested(donationId, memberId);
        return BaseResponse.ok(HttpStatus.OK, "거래 상태가 변경되었습니다.");
    }

    @PatchMapping("/{donationId}/members/{memberId}/completion/confirm")
    public ResponseEntity<?> donationChangeIntoCompletionCinfirmed(@PathVariable Long donationId, @PathVariable Long memberId) {
        modifyTradeUseCase.changeStatusToCompletionConfirmed(donationId, memberId);
        return BaseResponse.ok(HttpStatus.OK, "거래 상태가 변경되었습니다.");
    }

}
