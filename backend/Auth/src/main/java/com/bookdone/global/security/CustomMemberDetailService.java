package com.bookdone.global.security;


import com.bookdone.auth.dto.response.MemberResponse;
import com.bookdone.global.client.MemberServiceClient;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


/**
 * 현재 액세스 토큰으로 부터 인증된 유저의 상세정보(활성화 여부, 만료, 롤 등) 관련 서비스 정의.
 */

@RequiredArgsConstructor
@Service
public class CustomMemberDetailService implements UserDetailsService {

	private final MemberServiceClient memberServiceClient;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		try {

			ObjectMapper om = new ObjectMapper();
			MemberResponse findMember = om.convertValue(memberServiceClient.getMember(username).getBody(),
					MemberResponse.class);
			return new CustomMemberDetails(findMember);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
}
