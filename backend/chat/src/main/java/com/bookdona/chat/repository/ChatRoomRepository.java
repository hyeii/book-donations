package com.bookdona.chat.repository;

import java.util.List;
import java.util.Optional;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.bookdona.chat.document.ChatRoom;

public interface ChatRoomRepository extends MongoRepository<ChatRoom, ObjectId> {

	Optional<ChatRoom> findById(ObjectId id);

	List<ChatRoom> findByDonorIdOrRequesterId(Long donorId, Long requesterId);

}
