package com.bookdone.history.controller;

import com.bookdone.global.dto.BaseResponse;
import com.bookdone.history.application.HistoryUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/members/histories")
public class HistoryController {
    private final HistoryUseCase historyUseCase;

    @PostMapping("/donations/{donationId}")
    public ResponseEntity<?> addHistory(
            @RequestHeader("member-id") Long memberId, @PathVariable Long donationId) {
        // 한줄평 써달라는 Push 알림 눌러서 api로 옴
        // 이미 dummy history (status = UNWRITTEN, Content = null)이 있다고 가정

        historyUseCase.updateHistory(memberId, donationId);
        return BaseResponse.ok(HttpStatus.OK, "히스토리 작성 완료");
    }
}
