package com.bookdone.donation.dto.request;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class DonationListRequest {
    private String isbn;
    private Integer address;

}
