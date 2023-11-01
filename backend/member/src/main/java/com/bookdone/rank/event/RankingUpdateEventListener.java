package com.bookdone.rank.event;

import com.bookdone.rank.entity.MemberRanking;
import com.bookdone.rank.repository.MemberRankingRepository;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class RankingUpdateEventListener {

    private final MemberRankingRepository memberRankingRepository;

    @KafkaListener(topics = "ranking_update", groupId = "ranking_group")
    public void updateRanking(String message) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            List<String> nicknames = objectMapper.readValue(message, new TypeReference<List<String>>() {
            });
            nicknames.forEach(this::updateScore);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Transactional
    public void updateScore(String nickname) {
        MemberRanking memberRanking = memberRankingRepository.findById(nickname)
                .orElse(MemberRanking.registerNewMember(nickname, 0));
        memberRanking.increaseScore();
        memberRankingRepository.save(memberRanking);
    }
}
