package com.bookdona.global.exception;

import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.bookdona.global.response.BaseResponse;
import com.google.firebase.messaging.FirebaseMessagingException;

@RestControllerAdvice
public class GlobalException {
	@ExceptionHandler(IllegalArgumentException.class)
	public ResponseEntity<?> IllegalArgumentResponse(IllegalArgumentException ex) {
		return BaseResponse.fail(ex.getMessage(), 500);
	}

	@ExceptionHandler(HttpMessageNotReadableException.class)
	public ResponseEntity<?> HttpMessageNotReadableResponse(HttpMessageNotReadableException ex) {
		return BaseResponse.fail(ex.getMessage(), 400);
	}

	@ExceptionHandler(FirebaseMessagingException.class)
	public ResponseEntity<?> FirebaseMessagingResponse(FirebaseMessagingException ex) {
		return BaseResponse.fail(ex.getMessage(), 400);
	}

}
