package org.sangmin.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.sangmin.domain.MemberDTO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomUser extends User {


	private static final long serialVersionUTI = 1L;
	
	private MemberDTO member;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(MemberDTO dto) {
		super(dto.getUserid(), dto.getUserpw(), dto.getAuthList().stream().
				map(auth -> new SimpleGrantedAuthority(auth.getAuth())).
				collect(Collectors.toList()));
		
		this.member = dto;
				
	}
	
	
	
	
}
