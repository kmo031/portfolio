package org.sangmin.security;

import org.sangmin.domain.MemberDTO;
import org.sangmin.mapper.MemberMapper;
import org.sangmin.security.domain.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper member;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserName : " + username);
		
		MemberDTO dto = member.read(username);
		
		log.warn("queried by member mapper: " + dto);
		return dto == null ? null : new CustomUser(dto);
	}
}
