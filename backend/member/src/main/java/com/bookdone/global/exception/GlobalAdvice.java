package com.bookdone.global.exception;

import javax.servlet.http.HttpServletResponse;

import com.bookdone.global.response.BaseResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalAdvice {

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<?> illegalArgumentResponse(IllegalArgumentException ex) {
        return new BaseResponse().fail(ex.getMessage(), HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
}
