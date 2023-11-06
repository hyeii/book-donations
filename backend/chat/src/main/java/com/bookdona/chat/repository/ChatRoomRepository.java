package com.bookdona.chat.repository;

import java.util.List;
import java.util.Optional;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import com.bookdona.chat.document.ChatRoom;

@EnableMongoRepositories
public interface ChatRoomRepository extends MongoRepository<ChatRoom, ObjectId> {

	Optional<ChatRoom> findById(ObjectId id);

	Optional<ChatRoom> findByTradeId(Long tradeId);

	List<ChatRoom> findByParticipant1NicknameOrParticipant1Nickname(String memberNickname, String memberNickname1);
}
