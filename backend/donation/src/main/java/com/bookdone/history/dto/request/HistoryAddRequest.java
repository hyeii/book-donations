package com.bookdone.history.dto.request;

import com.bookdone.history.application.HistoryStatus;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class HistoryAddRequest {

    private Long donationId;
    private Long memberId;
    private String content;
}
