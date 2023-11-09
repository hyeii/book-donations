package com.bookdone.donation.infra.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.bookdone.donation.application.DonationStatus;
import com.bookdone.donation.domain.Donation;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "donation")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EntityListeners(AuditingEntityListener.class)
public class DonationEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private Long id;

	@Column(name = "isbn", nullable = false)
	private String isbn;

	@Column(name = "member_id", nullable = false)
	private Long memberId;

	@Column(nullable = false)
	private String address;

	@Column(nullable = false)
	private String content;

	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private DonationStatus status;

	@Column(name = "delivery", nullable = false)
	private boolean canDelivery;

	@CreatedDate
	@Column(name = "created_at", nullable = false)
	private LocalDateTime createdAt;

	public static Donation toDomain(DonationEntity donationEntity) {
		return Donation.createDonation(donationEntity);
	}

	public static DonationEntity fromDomain(Donation donation) {
		return DonationEntity
			.builder()
			.id(donation.getId())
			.isbn(donation.getIsbn())
			.memberId(donation.getMemberId())
			.address(donation.getAddress())
			.content(donation.getContent())
			.status(donation.getStatus())
			.canDelivery(donation.isCanDelivery())
			.createdAt(donation.getCreatedAt())
			.build();
	}

}
