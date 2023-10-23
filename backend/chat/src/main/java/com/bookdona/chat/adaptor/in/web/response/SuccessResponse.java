package com.bookdona.chat.adaptor.in.web.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SuccessResponse {
    private boolean success;
    private String msg;
    private Object data;
}
