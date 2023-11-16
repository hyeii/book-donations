package com.bookdone.global.exception;

import com.bookdone.global.response.BaseResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletResponse;
import java.security.InvalidParameterException;

@RestControllerAdvice
public class GlobalAdvice {
    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<?> illegalArgumentResponse(IllegalArgumentException ex) {
        return new BaseResponse().fail(ex.getMessage(), HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(InvalidParameterException.class)
    public ResponseEntity<?> invalidParameterResponse(InvalidParameterException ex) {
        return new BaseResponse().fail(ex.getMessage(), HttpServletResponse.SC_BAD_REQUEST);
    }
}
