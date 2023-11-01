package com.bookdone.rank.controller;

import com.bookdone.global.response.BaseResponse;
import com.bookdone.rank.dto.UpdateRankingDto;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/ranks")
public class RankController {
    private final KafkaTemplate<String, String> kafkaTemplate;

    @PostMapping
    public ResponseEntity<?> updateRanking(@RequestBody UpdateRankingDto updateRankingDto) {
        List<String> nicknames = new ArrayList<>();
        nicknames.add(updateRankingDto.getNickname1());
        nicknames.add(updateRankingDto.getNickname2());
        String payload = null; // Jackson 라이브러리를 사용하여 JSON 변환
        try {
            payload = new ObjectMapper().writeValueAsString(nicknames);
        } catch (JsonProcessingException e) {
            return BaseResponse.fail("json 변환 실패", 400);
        }
        kafkaTemplate.send("ranking_update", payload);
        return BaseResponse.ok(HttpStatus.OK, "producing complete");
    }
}
