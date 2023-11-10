package com.bookdone.member.event.listener;

import com.bookdone.member.service.MemberService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.json.JsonParseException;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.security.InvalidParameterException;
import java.util.Map;

@Component
@RequiredArgsConstructor
@Slf4j
public class MemberUpdateListener {
    private final MemberService memberService;
    private final ObjectMapper objectMapper;

    @KafkaListener(topics = "request-donation", groupId = "request-donation-group")
    public void decreasePointOnReservationRequest(String message) {
        log.info("request-donation Event Catch!");
        try {
            Map<String, Long> map = objectMapper.readValue(message, new TypeReference<Map<String, Long>>() {
            });
            Long memberId = map.get("memberId");
            memberService.updateMembersPointById(memberId, false);
        } catch (IOException e) {
            throw new InvalidParameterException("잘못된 Event 데이터 입니다.");
        }
    }

    @KafkaListener(topics = "cancel-donation", groupId = "cancel-donation-group")
    public void increasePointOnDonationCancel(String message) {
        log.info("cancel-donation Event Catch!");
        try {
            Map<String, Long> map = objectMapper.readValue(message, new TypeReference<Map<String, Long>>() {
            });
            Long memberId = map.get("memberId");
            memberService.updateMembersPointById(memberId, true);
        } catch (IOException e) {
            throw new InvalidParameterException("잘못된 Event 데이터 입니다.");
        }
    }

    @KafkaListener(topics = "complete-donation", groupId = "complete-donation-group")
    public void increasePointOnDonationFinish(String message) {
        log.info("complete-donation Event Catch!");
        try {
            Map<String, Long> map = objectMapper.readValue(message, new TypeReference<Map<String, Long>>() {
            });
            Long memberId = map.get("donor");
            memberService.updateMembersPointById(memberId, true);
        } catch (IOException e) {
            throw new InvalidParameterException("잘못된 Event 데이터 입니다.");
        }
    }

}
