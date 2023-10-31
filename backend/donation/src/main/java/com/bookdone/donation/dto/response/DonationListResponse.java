package com.bookdone.donation.dto.response;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DonationListResponse {

    private Long id;
    private String nickname;
    private Long historyCount;
    private Integer address;
    private LocalDateTime createdAt;
}
