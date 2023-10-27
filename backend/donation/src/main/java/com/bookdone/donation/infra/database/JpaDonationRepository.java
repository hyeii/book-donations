package com.bookdone.donation.infra.database;

import com.bookdone.donation.application.DonationStatus;
import com.bookdone.donation.infra.entity.DonationEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface JpaDonationRepository extends JpaRepository<DonationEntity, Long> {
    List<DonationEntity> findAllByIsbnAndAddress(Long isbn, Integer address);
}
