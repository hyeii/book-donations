package com.bookdona.global.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.bookdona.global.response.SuccessResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FeignResponse {
	private static final ObjectMapper objectMapper = new ObjectMapper();

	public static <T> T extractDataFromResponse(ResponseEntity<?> responseEntity, Class<T> clazz) throws
		IllegalArgumentException,
		JsonProcessingException {

		if (responseEntity.getBody() instanceof SuccessResponse) {
			SuccessResponse successResponse = (SuccessResponse) responseEntity.getBody();
			log.info("SuccessResponse: {}", successResponse);

			if (!successResponse.isSuccess()) {
				String msg = successResponse.getMsg();
				throw new IllegalArgumentException("API 호출 실패: " + msg);
			}

			T data = objectMapper.convertValue(successResponse.getData(), clazz);
			return data;
		} else {
			throw new IllegalArgumentException("응답이 SuccessResponse 타입이 아닙니다.");
		}
	}
}
