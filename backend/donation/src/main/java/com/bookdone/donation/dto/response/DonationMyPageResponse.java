package com.bookdone.donation.dto.response;

import com.bookdone.donation.application.DonationStatus;
import com.bookdone.history.dto.response.HistoryResponse;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DonationMyPageResponse {

    private Long id;
    private String title;
    private String titleUrl;
    private String isbn;
    private DonationStatus donationStatus;
    private LocalDateTime donatedAt;
    private List<HistoryResponse> historyResponseList;
}
