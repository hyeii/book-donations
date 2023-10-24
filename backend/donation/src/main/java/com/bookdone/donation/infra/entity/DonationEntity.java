package com.bookdone.donation.infra.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;

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

    @Column(name = "book_id")
    private Long bookId;

    private String address;
    private String content;
    private boolean canDelivery;

    @Column(name = "created_time")
    private LocalDateTime createdTime;

}
