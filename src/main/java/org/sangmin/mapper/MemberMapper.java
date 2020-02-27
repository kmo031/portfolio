package org.sangmin.mapper;

import org.sangmin.domain.MemberDTO;

public interface MemberMapper {

	public MemberDTO read(String userId); // 사용자 정보 가져오기
	
	public int idCheck(String userId); //중복 아이디 체크
	
	public void registerUser(MemberDTO member);
	
	public void registerAuth(String userId);
	
	
}
