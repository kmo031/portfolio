package org.sangmin.service;

import java.util.List;

import org.sangmin.domain.BoardDTO;
import org.sangmin.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper board;
	 

	@Override
	public List<BoardDTO> BoardList() {

		log.info("게시판 가져오기 서비스 구현");
		
		return board.getBoardList();
	}


	@Override
	public List<BoardDTO> NoticeList() {

		log.info("공지사항 가져오기 서비스 구현");
		
		return board.getNoticeList();
	}


	@Override
	public BoardDTO read(int id) {
		// TODO Auto-generated method stub
		return board.read(id);
	}

}
