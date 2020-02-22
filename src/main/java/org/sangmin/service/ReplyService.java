package org.sangmin.service;

import java.util.List;

import org.sangmin.domain.Criteria;
import org.sangmin.domain.ReplyDTO;

public interface ReplyService {

	public int register(ReplyDTO dto);
	
	public int modify(ReplyDTO dto);
	
	public int remove(int rno);
	
	public ReplyDTO get(int rno);
	
	public List<ReplyDTO> getList(Criteria cri, int id);
}
