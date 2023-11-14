package com.bookdone.donation.application;

import com.bookdone.client.api.BookClient;
import com.bookdone.client.api.MemberClient;
import com.bookdone.client.dto.BookResponse;
import com.bookdone.donation.application.repository.DonationImageRepository;
import com.bookdone.donation.application.repository.DonationRepository;
import com.bookdone.donation.domain.Donation;
import com.bookdone.donation.dto.request.DonationAddRequest;
import com.bookdone.donation.dto.request.NotificationRequest;
import com.bookdone.util.ResponseUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Transactional
public class AddDonationUseCase {

    private final DonationRepository donationRepository;
    private final DonationImageRepository donationImageRepository;
    private final KafkaTemplate<String, NotificationRequest> kafkaTemplate;
    private final BookClient bookClient;
    private final ResponseUtil responseUtil;
    private final String REQUEST_TOPIC_NAME = "notification-topic";

    public Long addDonation(DonationAddRequest donationAddRequest) throws JsonProcessingException {
        Donation donation = donationAddRequest.toDomain();
        Long id = donationRepository.save(donation);

        String isbn = donation.getIsbn();

        List<String> idList = responseUtil.extractDataFromResponse(bookClient.getBookLikesList(isbn), List.class);

        String payload = null; // Jackson 라이브러리를 사용하여 JSON 변환
        NotificationRequest notificationRequest = new NotificationRequest(null,"Book Done","좋아요 한 글이 등록되었습니다.");
        for (String memberId : idList) {
            notificationRequest.setTargetUserId(Long.valueOf(memberId));
            kafkaTemplate.send(REQUEST_TOPIC_NAME, notificationRequest);
        }


        donationImageRepository.saveImageList(id, donationAddRequest.getImages());
        return id;
    }

    public Long readdDonation(DonationAddRequest donationAddRequest) throws JsonProcessingException {
        Donation donation = donationAddRequest.toDomain();
        Long id = donationRepository.update(donation);

        String isbn = donation.getIsbn();

        List<String> idList = responseUtil.extractDataFromResponse(bookClient.getBookLikesList(isbn), List.class);

        String payload = null; // Jackson 라이브러리를 사용하여 JSON 변환
        NotificationRequest notificationRequest = new NotificationRequest(null,"Book Done","좋아요 한 글이 등록되었습니다.");
        for (String memberId : idList) {
            notificationRequest.setTargetUserId(Long.valueOf(memberId));
            kafkaTemplate.send(REQUEST_TOPIC_NAME, notificationRequest);
        }

        donationImageRepository.saveImageList(id, donationAddRequest.getImages());
        return id;
    }

}
