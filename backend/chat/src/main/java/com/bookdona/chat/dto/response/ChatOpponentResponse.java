package com.bookdona.chat.dto.response;

import com.bookdona.chat.dto.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatOpponentResponse {

	Member member;
}
