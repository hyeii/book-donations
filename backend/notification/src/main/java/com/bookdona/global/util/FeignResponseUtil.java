package com.bookdona.global.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FeignResponseUtil {
	private static final ObjectMapper objectMapper = new ObjectMapper();

	public static <T> T extractDataFromResponse(ResponseEntity<?> responseEntity, Class<T> clazz) throws IllegalArgumentException,
		JsonProcessingException {
		HttpStatus status = responseEntity.getStatusCode();
		log.info("body : {}", responseEntity.getBody());
		Map<String, Object> objectMap = (HashMap<String, Object>) responseEntity.getBody();
		log.info("map : {} ", objectMap);
		boolean success = (boolean) objectMap.get("success");

		// 응답 코드가 2xx가 아니면 오류 던지기
		if (!success) {
			String msg = (String) objectMap.get("msg");
			throw new IllegalArgumentException("API 호출 실패: " + msg);
		}

		Object data = objectMap.get("data");
		return objectMapper.convertValue(data, clazz);
	}
}
