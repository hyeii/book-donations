package com.bookdone.donation.dto.response;

import com.bookdone.history.dto.response.HistoryResponse;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DonationDetailsResponse {

    private Long id;
    private Long isbn;
    private String nickname;
    private Integer address;
    private String content;
    private boolean canDelivery;
    private List<HistoryResponse> historyResponseList;
    private List<String> imageUrlList;

}
