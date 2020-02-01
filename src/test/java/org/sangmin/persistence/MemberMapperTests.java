package org.sangmin.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sangmin.domain.MemberDTO;
import org.sangmin.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Test
	public void testRead() {
		MemberDTO dto = mapper.read("admin7");
		log.info(dto);
		
		dto.getAuthList().forEach(authDTO -> log.info(authDTO));
	}
	

}
