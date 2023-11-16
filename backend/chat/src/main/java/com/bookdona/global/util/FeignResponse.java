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

		log.info("responseEntity: {}", responseEntity);

		Object responseBody = responseEntity.getBody();

		if (responseBody instanceof Map) {
			@SuppressWarnings("unchecked")
			Map<String, Object> responseBodyMap = (Map<String, Object>) responseBody;
			if (!(boolean) responseBodyMap.get("success")) {
				String msg = (String) responseBodyMap.get("msg");
				throw new IllegalArgumentException("API 호출 실패: " + msg);
			}

			T data = objectMapper.convertValue(responseBodyMap.get("data"), clazz);
			log.info("data: {}", data);
			return data;
		} else {
			throw new IllegalArgumentException("응답이 SuccessResponse 타입이 아닙니다.");
		}
	}
}
