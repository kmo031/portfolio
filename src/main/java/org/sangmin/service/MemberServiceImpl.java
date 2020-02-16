package org.sangmin.service;

import org.sangmin.domain.MemberDTO;
import org.sangmin.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	
	//id중복검사
	@Override
	public int idCheck(String userId) {
		log.info("아이디 중복검사 service");
		return mapper.idCheck(userId);
	}

	//회원가입
	@Override
	public void registerUser(MemberDTO member) {
		String encPassword = pwEncoder.encode(member.getUserPw());
		  member.setUserPw(encPassword);
		  log.info("암호화된 비밀번호 : "+ member.getUserPw());
		mapper.registerUser(member);
		mapper.registerAuth(member.getUserId());
		
	}

}
