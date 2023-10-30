package com.bookdone.donation.application.repository;

import com.bookdone.donation.domain.Donation;

import java.util.List;

public interface DonationRepository {

    public Long save(Donation donation);

    public Long update(Donation donation);

    public Donation findById(Long id);

    public List<Donation> findAllByIsbnAndAddress(Long isbn, Integer address);
}
