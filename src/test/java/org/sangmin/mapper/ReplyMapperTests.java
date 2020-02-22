package org.sangmin.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sangmin.domain.Criteria;
import org.sangmin.domain.ReplyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
public class ReplyMapperTests {

	// 해당 게시물 번호
	private int[] bnoArr = { 1099, 1100 };

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper reply;

	/*
	 * //댓글 입력 테스트
	 * 
	 * @Test public void testInsert() {
	 * 
	 * IntStream.range(1, 4).forEach(i -> {
	 * 
	 * ReplyDTO dto = new ReplyDTO();
	 * 
	 * dto.setId(bnoArr[i % 5]); dto.setReply("댓글테스트" + i); dto.setReplyer("replyer"
	 * + i);
	 * 
	 * reply.insert(dto);
	 * 
	 * }); }
	 */
	
	/*
	 * //댓글 가져오기 테스트
	 * 
	 * @Test public void testRead() { int targetRno = 1;
	 * 
	 * ReplyDTO dto = reply.read(targetRno); log.info(dto); }
	 */
	
	/*
	 * //댓글 삭제 테스트
	 * 
	 * @Test public void testDelete() { int targetRno = 1;
	 * 
	 * reply.delete(targetRno); }
	 */
	
	/*
	 * @Test public void testUpdate() {
	 * 
	 * int targetRno = 2;
	 * 
	 * ReplyDTO dto = reply.read(targetRno);
	 * 
	 * dto.setReply("업데이트");
	 * 
	 * int count = reply.update(dto);
	 * 
	 * log.info("업데이트 카운트" + count); }
	 */
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<ReplyDTO> replies = reply.getListWithPaging(cri, 1099);
		
		replies.forEach(reply -> log.info(reply));
	}
	/*
	 * @Test public void testMapper() { log.info(reply); }
	 */
}
