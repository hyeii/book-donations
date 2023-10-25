package com.bookdone.donation.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/donations")
public class DonationController {

    @GetMapping
    public ResponseEntity<?> donationList() {
        return null;
    }

    @GetMapping("/{donationId}")
    public ResponseEntity<?> donationDetails(@PathVariable long donationId) {
        return null;
    }

    @PostMapping
    public ResponseEntity<?> donationAdd() {
        return null;
    }

    @PutMapping("/{donationId}")
    public ResponseEntity<?> donationReAdd(){ return null;}

    @PatchMapping
    public ResponseEntity<?> donationModify() {
        return null;
    }

    @DeleteMapping
    public ResponseEntity<?> donationRemove() {
        return null;
    }

}
