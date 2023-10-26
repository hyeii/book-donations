package com.bookdone.donation.dto.response;

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
    private List<String> imageUrlList;

}
