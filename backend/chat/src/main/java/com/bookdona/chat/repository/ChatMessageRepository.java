package com.bookdona.chat.repository;

import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import com.bookdona.chat.document.ChatMessage;

@EnableMongoRepositories
public interface ChatMessageRepository extends MongoRepository<ChatMessage, ObjectId> {

	List<ChatMessage> findByIdIn(List<ObjectId> chatMessageIds);

	List<ChatMessage> findByTradeId(Long tradeId);

	void deleteAllByTradeId(Long tradeId);
}
