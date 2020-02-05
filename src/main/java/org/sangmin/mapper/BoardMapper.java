package org.sangmin.mapper;

import org.sangmin.domain.BoardDTO;
import java.util.List;

public interface BoardMapper {
	
	public List<BoardDTO> getBoardList(); //게시판 목록 가져오기
	
	public List<BoardDTO> getNoticeList(); //공지사항 목록 가져오기
	
	public BoardDTO read(int id);     //공지사항 id에 맞는 정보 가져오기
	

}
