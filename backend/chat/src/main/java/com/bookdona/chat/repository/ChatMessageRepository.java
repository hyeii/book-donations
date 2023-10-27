package com.bookdona.chat.repository;

import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.bookdona.chat.document.ChatMessage;

public interface ChatMessageRepository extends MongoRepository<ChatMessage, ObjectId> {

	List<ChatMessage> findByIdIn(List<ObjectId> chatMessageIds);

	List<ChatMessage> findByChatRoomId(ObjectId chatRoomId);
}
