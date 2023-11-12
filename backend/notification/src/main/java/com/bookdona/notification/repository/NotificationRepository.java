package com.bookdona.notification.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bookdona.notification.entity.NotificationEntity;
import com.bookdona.notification.entity.NotificationStatus;

@Repository
public interface NotificationRepository extends JpaRepository<NotificationEntity, Long> {
	List<NotificationEntity> findByMemberIdAndStatus(long memberId, NotificationStatus status);
}
