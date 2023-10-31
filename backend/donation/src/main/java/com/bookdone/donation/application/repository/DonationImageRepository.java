package com.bookdone.donation.application.repository;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface DonationImageRepository {
    List<String> findImageUrlList(Long donationId);

    void saveImageList(Long donationId, List<MultipartFile> imageList);
}
