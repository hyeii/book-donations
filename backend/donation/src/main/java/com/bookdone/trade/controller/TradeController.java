package com.bookdone.trade.controller;

import com.bookdone.global.dto.BaseResponse;
import com.bookdone.trade.application.AddTradeUseCase;
import com.bookdone.trade.application.ModifyTradeUseCase;
import com.bookdone.trade.application.RemoveTradeUseCase;
import com.fasterxml.jackson.databind.ser.Serializers;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/trades/donations")
public class TradeController {

    private final ModifyTradeUseCase modifyTradeUseCase;
    private final RemoveTradeUseCase removeTradeUseCase;
    private final AddTradeUseCase addTradeUseCase;

    @PatchMapping("/{donationId}/members/{memberId}/reservations/request")
    public ResponseEntity<?> tradeChangeToDonationRequested(@PathVariable Long donationId, @PathVariable Long memberId) {
        modifyTradeUseCase.changeStatusToDonationRequested(donationId, memberId);
        return BaseResponse.ok(HttpStatus.OK, "거래 상태가 변경되었습니다.");
    }

    @PatchMapping("/{donationId}/members/{memberId}/reservations/confirm")
    public ResponseEntity<?> tradeChangeToDonationConfirmed(@PathVariable Long donationId, @PathVariable Long memberId) {
        modifyTradeUseCase.changeStatusToDonationConfirmed(donationId, memberId);
        return BaseResponse.ok(HttpStatus.OK, "거래 상태가 변경되었습니다.");
    }

    @PatchMapping("/{donationId}/members/{memberId}/completion/request")
    public ResponseEntity<?> tradeChangeToCompletionRequested(@PathVariable Long donationId, @PathVariable Long memberId) {
        modifyTradeUseCase.changeStatusToCompletionRequested(donationId, memberId);
        return BaseResponse.ok(HttpStatus.OK, "거래 상태가 변경되었습니다.");
    }

    @PatchMapping("/{donationId}/members/{memberId}/completion/confirm")
    public ResponseEntity<?> tradeChangeToCompletionConfirmed(@PathVariable Long donationId, @PathVariable Long memberId) {
        modifyTradeUseCase.changeStatusToCompletionConfirmed(donationId, memberId);
        return BaseResponse.ok(HttpStatus.OK, "거래 상태가 변경되었습니다.");
    }

    @DeleteMapping("{donationId}/members/{memberId}")
    public ResponseEntity<?> tradeRemove(@PathVariable Long donationId, @PathVariable Long memberId) {
        removeTradeUseCase.removeTrade(donationId, memberId);
        return BaseResponse.ok(HttpStatus.OK, "거래가 취소되었습니다.");
    }

    @PostMapping("{donationId}/members/{memberId}")
    public ResponseEntity<?> tradeAdd(@PathVariable Long donationId, @PathVariable Long memberId) {
        addTradeUseCase.tradeAdd(donationId, memberId);
        return BaseResponse.ok(HttpStatus.CREATED, "거래가 등록되었습니다.");
    }
}