package com.bookdone.donation.dto.response;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DonationCountResponse {
    private String address;
    private Long bookCount;
}
