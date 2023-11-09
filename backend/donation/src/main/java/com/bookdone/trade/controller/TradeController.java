package com.bookdone.trade.controller;

import com.bookdone.global.dto.BaseResponse;
<<<<<<< HEAD
import com.bookdone.trade.application.*;
=======
import com.bookdone.trade.application.AddTradeUseCase;
import com.bookdone.trade.application.ModifyTradeUseCase;
import com.bookdone.trade.application.RemoveTradeUseCase;
import com.fasterxml.jackson.core.JsonProcessingException;
>>>>>>> 8baf3e74b4a77bdf5c1dfa55bc86a1fd06f520ca
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/trades/donations")
<<<<<<< HEAD
=======
@Slf4j
>>>>>>> 8baf3e74b4a77bdf5c1dfa55bc86a1fd06f520ca
public class TradeController {

    private final ModifyTradeUseCase modifyTradeUseCase;
    private final RemoveTradeUseCase removeTradeUseCase;
    private final AddTradeUseCase addTradeUseCase;
    private final KafkaTemplate<String, String> kafkaTemplate;
    private final FindTradeUseCase findTradeUseCase;

    @GetMapping("/{donationId}/members/{memberId}/reservations/confirm")
    public ResponseEntity<?> tradeDetails(@PathVariable Long donationId, @PathVariable Long memberId) {
        TradeStatus tradeStatus = findTradeUseCase.findTradeStatus(donationId, memberId);

        return BaseResponse.okWithData(HttpStatus.OK, "거래 상태가 조회되었습니다.", tradeStatus);
    }

    @GetMapping("/test/kafka")
    public ResponseEntity<?> test() throws JsonProcessingException {
        Map<String, String> map = new HashMap<>();
        map.put("memberId", "33");
        ObjectMapper objectMapper = new ObjectMapper();
        String payload = objectMapper.writeValueAsString(map);
        log.info("payload = {}", payload);
        kafkaTemplate.send("reservation-request", payload);
        return BaseResponse.ok(HttpStatus.OK, "OK");
    }

    @PatchMapping("/{donationId}/members/{memberId}/reservations/request")
    public ResponseEntity<?> tradeChangeToDonationRequested(@PathVariable Long donationId, @PathVariable Long memberId) {
        modifyTradeUseCase.changeStatusToDonationRequested(donationId, memberId);
        String payload = null; // Jackson 라이브러리를 사용하여 JSON 변환
        try {
            Map<String, String> map = new HashMap<>();
            map.put("memberId", String.valueOf(memberId));
            payload = new ObjectMapper().writeValueAsString(map);
        } catch (Exception e) {
            return BaseResponse.fail("json 변환 실패", 400);
        }
        kafkaTemplate.send("reservation-request", payload);
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
        Long id = modifyTradeUseCase.changeStatusToCompletionConfirmed(donationId, memberId);
        String payload = null; // Jackson 라이브러리를 사용하여 JSON 변환
        try {
            Map<String, Long> map = new HashMap<>();
            map.put("donor", id);
            map.put("receiver", memberId);
            payload = new ObjectMapper().writeValueAsString(map);
        } catch (Exception e) {
            return BaseResponse.fail("json 변환 실패", 400);
        }
        kafkaTemplate.send("donation-finish", payload);
        return BaseResponse.ok(HttpStatus.OK, "거래 상태가 변경되었습니다.");
    }

    @DeleteMapping("/{donationId}/members/{memberId}")
    public ResponseEntity<?> tradeRemove(@PathVariable Long donationId, @PathVariable Long memberId) {
        removeTradeUseCase.removeTrade(donationId, memberId);

        String payload = null; // Jackson 라이브러리를 사용하여 JSON 변환
        try {
            Map<String, Long> map = new HashMap<>();
            map.put("memberId", memberId);
            payload = new ObjectMapper().writeValueAsString(map);
        } catch (Exception e) {
            return BaseResponse.fail("json 변환 실패", 400);
        }
        kafkaTemplate.send("donation-cancel", payload);
        return BaseResponse.ok(HttpStatus.OK, "거래가 취소되었습니다.");
    }

    @PostMapping("/{donationId}/members/{memberId}")
    public ResponseEntity<?> tradeAdd(@PathVariable Long donationId, @PathVariable Long memberId) {
        Long id = addTradeUseCase.tradeAdd(donationId, memberId);
        return BaseResponse.okWithData(
                HttpStatus.CREATED,
                "거래가 등록되었습니다.",
                id);
    }
}
