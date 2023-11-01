package com.bookdone.rank.repository;

import com.bookdone.rank.entity.MemberRanking;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface MemberRankingRepository extends CrudRepository<MemberRanking, String> {
    @Override
    Optional<MemberRanking> findById(String nickname);
}