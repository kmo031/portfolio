package org.sangmin.service;

import java.util.List;

import org.sangmin.domain.BoardDTO;
import org.sangmin.domain.Criteria;

public interface BoardService {
	
	//public List<BoardDTO> BoardList(); //게시판 목록 페이징 가져오기
	public List<BoardDTO> BoardList(Criteria cri);
	//public List<BoardDTO> NoticeList(); // 공지사항 목록 페이징 가져오기
	public List<BoardDTO> NoticeList(Criteria cri);
	public BoardDTO read(int id); //게시글 상세내용 가져오기
	public void register(BoardDTO board); //게시글 등록
	public boolean modify(BoardDTO board); //게시글 업데이트
	public boolean remove(int id); //게시글 삭제
	
	public int getTotal(Criteria cri); //게시글 갯수 구하기

}
