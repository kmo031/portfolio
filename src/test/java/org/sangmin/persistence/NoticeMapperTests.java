package org.sangmin.persistence;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.sangmin.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTests {

	//Mapper 객체생성
	@Setter(onMethod_ = {@Autowired})
	private NoticeMapper notice;
	
	//목록 가져오기
	@Test
	public void getList() {
		notice.getList().forEach(List -> log.info(List));
	}
	
}
