package org.sangmin.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sangmin.domain.BoardDTO;
import org.sangmin.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTest {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	
	/*
	 * //게시판 리스트 가져오기
	 * 
	 * @Test public void insert() { service.BoardList(); }
	 */
	
	//게시판 작성하기 테스트
	/*
	 * @Test public void create() { BoardDTO board = new BoardDTO();
	 * 
	 * board.setContent("서비스 테스트"); board.setTitle("서비스 테스트 제목");
	 * board.setWriter_Id("정상민"); board.setType("board");
	 * 
	 * service.create(board);
	 * 
	 * }
	 */
	
	//게시판 업데이트 테스트
	/*
	 * @Test public void modify() { BoardDTO board = new BoardDTO();
	 * board.setId(21); board.setContent("서비스 업데이트 테스트");
	 * board.setTitle("서비스 엡데이트 테스트 제목"); board.setWriter_Id("정상민2");
	 * board.setType("notice");
	 * 
	 * service.modify(board); }
	 */
	
	//게시판 삭제 테스트
	/*
	 * @Test public void remove() {
	 * 
	 * service.remove(21); }
	 */
}
