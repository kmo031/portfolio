package org.sangmin.service;

import java.util.List;

import org.sangmin.domain.Criteria;
import org.sangmin.domain.ReplyDTO;
import org.sangmin.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	
	@Setter(onMethod_ = @Autowired )
	private ReplyMapper mapper;

	
	//댓글 생성
	@Override
	public int register(ReplyDTO dto) {
		// TODO Auto-generated method stub
		return mapper.insert(dto);
	}
	
	//댓글 수정
	@Override
	public int modify(ReplyDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}
	
	//댓글삭제
	@Override
	public int remove(int rno) {
		// TODO Auto-generated method stub
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
	public List<ReplyDTO> getList(Criteria cri, int id) {
		return mapper.getListWithPaging(cri, id);
	}

}
