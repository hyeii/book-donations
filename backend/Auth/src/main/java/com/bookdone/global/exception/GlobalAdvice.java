package com.bookdone.global.exception;

import com.bookdone.global.response.BaseResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletResponse;

@RestControllerAdvice
public class GlobalAdvice {

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<?> illegalArgumentResponse(IllegalArgumentException ex) {
        return new BaseResponse().fail(ex.getMessage(), HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(JsonProcessingException.class)
    public ResponseEntity<?> jsonProcessingResponse(JsonProcessingException ex) {
        return new BaseResponse().fail(ex.getMessage(), HttpServletResponse.SC_BAD_REQUEST);
    }

    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity<?> runtimeResponse(RuntimeException ex) {
        return new BaseResponse().fail(ex.getMessage(), HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
}
