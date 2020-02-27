package org.sangmin.service;

import org.sangmin.domain.Criteria;
import org.sangmin.domain.ReplyDTO;
import org.sangmin.domain.ReplyPageDTO;

public interface ReplyService {

	public int register(ReplyDTO dto);
	
	public int modify(ReplyDTO dto);
	
	public int remove(int rno);
	
	public ReplyDTO get(int rno);
	
	public ReplyPageDTO getList(Criteria cri, int id);
}
