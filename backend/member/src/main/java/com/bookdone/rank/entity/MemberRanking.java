package com.bookdone.rank.entity;


import lombok.AllArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

@AllArgsConstructor
@RedisHash("MemberRanking")
public class MemberRanking {
    @Id
    private String nickname;

    private int score;

    public void increaseScore() {
        this.score++;
    }

    public static MemberRanking registerNewMember(String nickname, int score) {
        return new MemberRanking(nickname, score);
    }
}
