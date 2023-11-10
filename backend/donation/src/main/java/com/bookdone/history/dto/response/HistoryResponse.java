package com.bookdone.history.dto.response;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HistoryResponse {

    private String title;
    private String titleUrl;
    private String content;
    private String nickname;
    private LocalDateTime createdAt;
}
