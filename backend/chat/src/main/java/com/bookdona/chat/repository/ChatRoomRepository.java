package com.bookdona.chat.repository;

import java.util.List;
import java.util.Optional;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import com.bookdona.chat.document.ChatRoom;

@EnableMongoRepositories
public interface ChatRoomRepository extends MongoRepository<ChatRoom, ObjectId> {

	Optional<ChatRoom> findById(ObjectId id);

	Optional<ChatRoom> findByTradeId(Long tradeId);

	@Query("{'$or': [{'user1': ?0}, {'user2': ?1}], 'isLive': true}")
	List<ChatRoom> findByUser1OrUser2AndIsLiveTrue(String user1, String user2);

	@Query("{ 'tradeId': ?0, $or: [ { 'user1': ?1, 'user2': ?2 }, { 'user1': ?2, 'user2': ?1 } ] }")
	Optional<ChatRoom> findByTradeIdAndUsersInAnyOrder(Long tradeId, String user1, String user2);

	void deleteByTradeId(Long tradeId);
}
