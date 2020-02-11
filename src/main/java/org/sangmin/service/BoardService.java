package org.sangmin.service;

import java.util.List;

import org.sangmin.domain.BoardDTO;

public interface BoardService {
	
	public List<BoardDTO> BoardList(); //게시판 목록 가져오기
	public List<BoardDTO> NoticeList(); // 공지사항 목록 가져오기
	public BoardDTO read(int id); //게시글 상세내용 가져오기
	public void register(BoardDTO board); //게시글 등록
	public boolean modify(BoardDTO board); //게시글 업데이트
	public boolean remove(int id); //게시글 삭제

}
