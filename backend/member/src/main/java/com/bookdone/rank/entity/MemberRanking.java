package com.bookdone.rank.entity;


import org.springframework.data.redis.core.RedisHash;

import javax.persistence.Id;

@RedisHash("MemberRanking")
public class MemberRanking {
    @Id
    private String nickname;

    private int rank;

    private int score;
}
