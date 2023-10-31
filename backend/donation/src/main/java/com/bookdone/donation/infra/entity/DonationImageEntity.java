package com.bookdone.donation.infra.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "donation_image")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DonationImageEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column(name = "donation_id", nullable = false)
    private Long donationId;

    @Column(nullable = false)
    private String url;

}
