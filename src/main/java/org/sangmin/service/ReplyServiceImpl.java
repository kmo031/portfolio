package org.sangmin.service;

import org.sangmin.domain.Criteria;
import org.sangmin.domain.ReplyDTO;
import org.sangmin.domain.ReplyPageDTO;
import org.sangmin.mapper.BoardMapper;
import org.sangmin.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	
	@Setter(onMethod_ = @Autowired )
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired )
	private BoardMapper boardMapper;

	
	//댓글 생성
	@Transactional
	@Override
	public int register(ReplyDTO dto) {

		boardMapper.updateReplyCnt(dto.getId(), 1); // 댓글 생성시 게시물의 댓글 카운트 상승
		
		return mapper.insert(dto);
	}
	
	//댓글 수정
	@Override
	public int modify(ReplyDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}
	
	//댓글삭제
	@Transactional
	@Override
	public int remove(int rno) {
		
		ReplyDTO dto = mapper.read(rno);

		boardMapper.updateReplyCnt(dto.getId(), -1); // 댓글 생성시 게시물의 댓글 카운트 다운
		
		return mapper.delete(rno);
	}

	//댓글 가져오기
	@Override
	public ReplyDTO get(int rno) {
		// TODO Auto-generated method stub
		return mapper.read(rno);
	}
	
	//댓글 페이지처리
	@Override
	public ReplyPageDTO getList(Criteria cri, int id) {
		
		return new ReplyPageDTO(
				mapper.getCountById(id),
				mapper.getListWithPaging(cri, id));
	}

}
