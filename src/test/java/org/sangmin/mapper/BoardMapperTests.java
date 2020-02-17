package org.sangmin.mapper;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sangmin.domain.BoardDTO;
import org.sangmin.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml"})
@Log4j
public class BoardMapperTests {

	//Mapper 객체생성
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;
	
	/*
	 * //목록 가져오기
	 * 
	 * @Test public void getList() { mapper.getBoardList().forEach(List ->
	 * log.info(List)); }
	 */
	
	/*
	 * //게시글 등록 테스트
	 * 
	 * @Test public void insert() { BoardDTO board = new BoardDTO();
	 * 
	 * board.setTitle("맵퍼인서트"); board.setContent("맵퍼 본문");
	 * board.setWriter_Id("맵퍼아이디"); board.setType("board");
	 * 
	 * mapper.insert(board); }
	 */
	
	/*
	 * //게시글 삭제 테스트
	 * 
	 * @Test public void delete() {
	 * 
	 * log.info("DELETE COUNT : " + mapper.delete(61)); }
	 */
	//업데이트 테스트
	/*
	 * @Test public void update() { BoardDTO board = new BoardDTO();
	 * 
	 * board.setId(21); board.setContent("맵퍼 업데이트 테스트");
	 * board.setTitle("맵퍼 업데이트 테스트");
	 * 
	 * int count = mapper.update(board); log.info("UPDATE COUNT : " + count); }
	 */
	
	/*
	 * //페이징 테스트
	 * 
	 * @Test public void pageTest() { Criteria cri = new Criteria();
	 * 
	 * cri.setPageNum(3); cri.setAmount(10);
	 * 
	 * List<BoardDTO> list = mapper.getListWithPaging(cri);
	 * 
	 * list.forEach(board -> log.info(board));
	 * 
	 * }
	 */
	
	//검색 테스트
	@Test
	public void testSearch() {
		
		Criteria cri = new Criteria();
		
		cri.setKeyword("1");
		cri.setType("TC");
		
		List<BoardDTO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
	}
}
