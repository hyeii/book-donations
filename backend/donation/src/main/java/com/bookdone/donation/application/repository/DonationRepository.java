package com.bookdone.donation.application.repository;

import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.dto.response.DonationCountResponse;

import java.util.List;

public interface DonationRepository {

    public Long save(Donation donation);

    public Long update(Donation donation);

    public Donation findById(Long id);

    public List<Donation> findAllByMemberId(Long memberId);

    public List<Donation> findAllByIsbnAndAddress(String isbn, String address);

    public List<DonationCountResponse> countAllByIsbnAndAddress(String isbn, String address);
}
