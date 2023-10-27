package com.bookdone.donation.controller;

import com.bookdone.donation.application.AddDonationUseCase;
import com.bookdone.donation.application.FindDonationUseCase;
import com.bookdone.donation.application.ModifyDonationUseCase;
import com.bookdone.donation.dto.request.DonationAddRequest;
import com.bookdone.global.dto.BaseResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/donations")
public class DonationController {

    private final AddDonationUseCase addDonationUseCase;
    private final FindDonationUseCase findDonationUseCase;
    private final ModifyDonationUseCase modifyDonationUseCase;

    @GetMapping
    public ResponseEntity<?> donationList(@RequestParam Long isbn, @RequestParam Integer address) throws JsonProcessingException {
        return BaseResponse.okWithData(HttpStatus.OK, "게시글 목록이 조회되었습니다.", findDonationUseCase.findDonationList(isbn, address));
    }

    @GetMapping("/{donationId}")
    public ResponseEntity<?> donationDetails(@PathVariable Long donationId) throws JsonProcessingException {
        return BaseResponse.okWithData(HttpStatus.OK, "게시글이 조회되었습니다.", findDonationUseCase.findDonation(donationId));
    }

    @PostMapping
    public ResponseEntity<?> donationAdd(DonationAddRequest donationAddRequest) {
        return BaseResponse.okWithData(HttpStatus.CREATED,"게시글이 등록되었습니다.", addDonationUseCase.addDonation(donationAddRequest));
    }

    @PutMapping("/{donationId}")
    public ResponseEntity<?> donationReadd(@PathVariable Long donationId, DonationAddRequest donationAddRequest){
        donationAddRequest.setId(donationId);
        return BaseResponse.okWithData(HttpStatus.CREATED, "게시글이 등록되었습니다.", addDonationUseCase.readdDonation(donationAddRequest));
    }

    @PatchMapping("/{donationId}/keeping")
    public ResponseEntity<?> donationChangeIntoKeeping(@PathVariable Long donationId) {
        modifyDonationUseCase.changeStatusToKeeping(donationId);
        return BaseResponse.ok(HttpStatus.OK, "게시글이 삭제되었습니다.");
    }

}
