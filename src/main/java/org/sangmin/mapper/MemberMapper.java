package org.sangmin.mapper;

import org.sangmin.domain.MemberDTO;

public interface MemberMapper {

	public MemberDTO read(String userid); // 사용자 정보 가져오기
}
