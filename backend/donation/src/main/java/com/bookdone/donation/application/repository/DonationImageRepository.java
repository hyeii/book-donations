package com.bookdone.donation.application.repository;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface DonationImageRepository {
    List<String> findImageUrlList(Long donationId, Long memberId);

    void saveImageList(Long donationId, Long memberId, List<MultipartFile> imageList);
}
