package com.bookdone.donation.infra.entity;

import com.bookdone.donation.domain.Donation;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "donation")
@Getter
@NoArgsConstructor
public class DonationEntity {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column(name = "book_id", nullable = false)
    private Long bookId;

    @Column(name = "member_id", nullable = false)
    private Long memberId;

    @Column(nullable = false)
    private Integer address;

    @Column(nullable = false)
    private String content;

    @Column(nullable = false)
    private Integer status;

    @Column(name = "delivery", nullable = false)
    private boolean canDelivery;

    @CreatedDate
    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    public static DonationEntity fromDomain(Donation donation) {
        return Donation.createEntity(donation);
    }

    public static Donation toDomain(DonationEntity donationEntity) {
        return Donation.createDonation(donationEntity);
    }

}
