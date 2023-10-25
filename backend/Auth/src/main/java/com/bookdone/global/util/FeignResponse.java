package com.bookdone.global.util;

import com.bookdone.global.response.FailResponse;
import com.bookdone.global.response.SuccessResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class FeignResponse {
    private static final ObjectMapper objectMapper = new ObjectMapper();

    public static <T> T extractDataFromResponse(ResponseEntity<?> responseEntity, Class<T> clazz) throws RuntimeException, JsonProcessingException {
        HttpStatus status = responseEntity.getStatusCode();

        // 응답 코드가 2xx가 아니면 오류 던지기
        if (!status.is2xxSuccessful()) {
            FailResponse failResponse = (FailResponse) responseEntity.getBody();
            throw new IllegalArgumentException("API 호출 실패: " + failResponse.getMsg());
        }

        Object data = ((SuccessResponse) responseEntity.getBody()).getData();

        if (data instanceof String) {
            return objectMapper.readValue((String) data, clazz);
        } else if (clazz.isInstance(data)) {
            return clazz.cast(data);
        }
        return null;
    }
}
