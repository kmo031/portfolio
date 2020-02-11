package org.sangmin.mapper;

import org.sangmin.domain.BoardDTO;
import java.util.List;

public interface BoardMapper {
	
	public List<BoardDTO> getBoardList(); //게시판 목록 가져오기
	
	public List<BoardDTO> getNoticeList(); //공지사항 목록 가져오기
	
	public BoardDTO read(int id);     //공지사항 id에 맞는 정보 가져오기
	
	//public void insert(BoardDTO board); // 게시글 등록
	
	public void insert(BoardDTO board); //게시글 등록
	
	public int update(BoardDTO board); // 게시글 수정
	
	public int delete(int id); //게시글 삭제
	

}
