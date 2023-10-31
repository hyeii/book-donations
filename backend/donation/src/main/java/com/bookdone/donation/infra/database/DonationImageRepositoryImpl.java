package com.bookdone.donation.infra.database;


import com.bookdone.donation.application.repository.DonationImageRepository;
import com.bookdone.donation.infra.entity.DonationImageEntity;
import com.bookdone.util.S3Uploader;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.stream.Collectors;


@Repository
@RequiredArgsConstructor
public class DonationImageRepositoryImpl implements DonationImageRepository {
    private final JpaDonationImageRepository jpaDonationImageRepository;
    private final S3Uploader s3Uploader;

    @Override
    public List<String> findImageUrlList(Long donationId) {
        return jpaDonationImageRepository.findAllByDonationId(donationId)
                .stream().map(donationImageEntity -> donationImageEntity.getUrl())
                .collect(Collectors.toList());
    }

    @Override
    public void saveImageList(Long donationId, List<MultipartFile> imageList) {
        List<DonationImageEntity> imageEntityList = imageList.stream()
                .map(multipartFile -> DonationImageEntity.builder()
                                .donationId(donationId)
                                .url(s3Uploader.uploadFile(multipartFile))
                                .build())
                .collect(Collectors.toList());

        jpaDonationImageRepository.saveAll(imageEntityList);
    }
}
