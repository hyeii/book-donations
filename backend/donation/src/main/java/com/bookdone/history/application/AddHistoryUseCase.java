package com.bookdone.history.application;

import com.bookdone.history.application.repository.HistoryRepository;
import com.bookdone.history.domain.History;
import com.bookdone.history.dto.request.HistoryAddRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class AddHistoryUseCase {
    private final HistoryRepository historyRepository;

    public Long updateHistory(HistoryAddRequest historyAddRequest) {
        History history = History.createHistory(historyAddRequest);
        return historyRepository.updateHistory(history);
    }
}
