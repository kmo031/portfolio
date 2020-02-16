package org.sangmin.service;

import org.sangmin.domain.MemberDTO;

public interface MemberService {
	public int idCheck(String userId); // 중복아이디 체크
	
	public void registerUser(MemberDTO member);
}
