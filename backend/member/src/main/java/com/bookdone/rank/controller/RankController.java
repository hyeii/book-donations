package com.bookdone.rank.controller;

import com.bookdone.global.response.BaseResponse;
import com.bookdone.rank.dto.MemberScoreDto;
import com.bookdone.rank.dto.UpdateRankingDto;
import com.bookdone.rank.event.RankingUpdateEventListener;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/ranks")
@Slf4j
public class RankController {
    private final KafkaTemplate<String, String> kafkaTemplate;
    private final RankingUpdateEventListener updateEventListener;

    @PostMapping("update")
    public ResponseEntity<?> updateRanking(@RequestBody UpdateRankingDto updateRankingDto) {
        List<String> nicknames = new ArrayList<>();
        log.info("{}", updateRankingDto);
        nicknames.add(updateRankingDto.getNickname1());
        nicknames.add(updateRankingDto.getNickname2());
        String payload = null; // Jackson 라이브러리를 사용하여 JSON 변환
        try {
            payload = new ObjectMapper().writeValueAsString(nicknames);
        } catch (Exception e) {
            return BaseResponse.fail("json 변환 실패", 400);
        }
        log.info("payload!! {}", payload);
        log.info("kafka tm = {}", kafkaTemplate);
        kafkaTemplate.send("ranking-update", payload);
        return BaseResponse.ok(HttpStatus.OK, "producing complete");
    }

    @GetMapping
    public ResponseEntity<?> getTopRankedMember() {
        List<MemberScoreDto> top10Members = updateEventListener.getTop10Members();
        return BaseResponse.okWithData(HttpStatus.OK, "상위 랭크 10 조회 완료", top10Members);
    }
}
