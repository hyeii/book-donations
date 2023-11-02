package com.bookdone.rank.event;

import com.bookdone.rank.dto.MemberScoreDto;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
@RequiredArgsConstructor
@Slf4j
public class RankingUpdateEventListener {

    private final RedisTemplate<String, String> redisTemplate;
    private final String RANKING_KEY = "rank";

    @KafkaListener(topics = "ranking_update", groupId = "ranking_group")
    public void updateRanking(String message) {
        log.info("event catch!!!!!!!!!!!!!!!!!!! = {}", message);
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            List<String> nicknames = objectMapper.readValue(message, new TypeReference<List<String>>() {
            });
            nicknames.forEach(nickname -> updateScore(nickname));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Transactional
    public void updateScore(String nickname) {
        // Redis Sorted Set에서 닉네임의 현재 점수(score)를 가져옵니다.
        Double currentScore = redisTemplate.opsForZSet().score(RANKING_KEY, nickname);

        if (currentScore == null) {
            // 닉네임이 존재하지 않으면 점수를 1로 설정합니다.
            redisTemplate.opsForZSet().add(RANKING_KEY, nickname, 1.0);
        } else {
            // 이미 존재하는 닉네임이면 기존 점수에 1을 더해 업데이트합니다.
            redisTemplate.opsForZSet().incrementScore(RANKING_KEY, nickname, 1.0);
        }
    }

    public List<MemberScoreDto> getTop10Members() {
        // Redis Sorted Set에서 상위 10명을 가져옵니다.
        Set<String> topMembers = redisTemplate.opsForZSet()
                .reverseRange(RANKING_KEY, 0, 9);

        List<MemberScoreDto> topMemberScores = new ArrayList<>();

        if (topMembers != null) {
            topMembers.forEach(nickname -> {
                Double score = redisTemplate.opsForZSet().score(RANKING_KEY, nickname);
                if (score != null) {
                    topMemberScores.add(new MemberScoreDto(nickname, score));
                }
            });
        }

        return topMemberScores;
    }
}
