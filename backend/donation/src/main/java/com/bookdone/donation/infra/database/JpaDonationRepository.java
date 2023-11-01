package com.bookdone.donation.infra.database;

import com.bookdone.donation.dto.response.DonationCountResponse;
import com.bookdone.donation.infra.entity.DonationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface JpaDonationRepository extends JpaRepository<DonationEntity, Long> {
    List<DonationEntity> findAllByIsbnAndAddress(Long isbn, String address);

    @Query("SELECT new com.bookdone.donation.dto.response.DonationCountResponse(d.address, COUNT(d)) FROM DonationEntity d WHERE d.isbn = :isbn AND" +
            " d.address LIKE :address% GROUP BY d.address")
    List<DonationCountResponse> countAllByIsbnAndAddress(Long isbn, String address);
}
