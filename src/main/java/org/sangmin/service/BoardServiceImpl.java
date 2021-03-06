package org.sangmin.service;

import java.util.List;

import org.sangmin.domain.BoardDTO;
import org.sangmin.domain.Criteria;
import org.sangmin.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper boardMapper;
	 

	@Override
	public List<BoardDTO> BoardList(Criteria cri) {

		log.info("게시판 가져오기 서비스 구현");
		
		return boardMapper.getListWithPaging(cri);
	}


	@Override
	public List<BoardDTO> NoticeList(Criteria cri) {

		log.info("공지사항 가져오기 서비스 구현");
		
		return boardMapper.getNoticeList();
	}


	@Override
	public BoardDTO read(int id) {
		
		log.info("게시글 가져오기 서비스 구현");
		
		boardMapper.plusHit(id); //게시글 상세가져올 시 조회수 상승
		
		return boardMapper.read(id);
	}


	@Override
	public void register(BoardDTO board) {
		
		log.info("게시글 작성 서비스 구현");
		
		boardMapper.insert(board);
		
	}


	@Override
	public boolean modify(BoardDTO board) {
		
		log.info("게시글 업데이트 서비스 구현");
		
		return boardMapper.update(board) == 1;
	}


	@Override
	public boolean remove(int id) {

		log.info("게시글 삭제 서비스 구현");
		
		return boardMapper.delete(id) == 1;
	}

	//게시글 갯수 구하기
	@Override
	public int getTotal(Criteria cri, String boardType) {
		log.info("게시글 갯수 구하기 service 구현");
		return boardMapper.getTotalCount(cri , boardType);
	}

}
