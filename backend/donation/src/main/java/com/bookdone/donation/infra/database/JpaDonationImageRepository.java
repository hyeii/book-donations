package com.bookdone.donation.infra.database;

import com.bookdone.donation.infra.entity.DonationImageEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface JpaDonationImageRepository extends JpaRepository<DonationImageEntity, Long> {
    List<DonationImageEntity> findAllByDonationId(Long donationId);

}
