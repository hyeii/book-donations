package com.bookdona.notification.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bookdona.notification.entity.Notification;
import com.bookdona.notification.entity.NotificationStatus;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Long> {
	List<Notification> findByMemberIdAndStatus(long memberId, NotificationStatus status);
}
