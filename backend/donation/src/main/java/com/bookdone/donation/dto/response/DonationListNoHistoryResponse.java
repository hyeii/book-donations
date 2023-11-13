package com.bookdone.donation.dto.response;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DonationListNoHistoryResponse {
    private Long id;
    private String title;
    private String titleUrl;
}
