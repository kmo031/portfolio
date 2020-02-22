package org.sangmin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sangmin.domain.Criteria;
import org.sangmin.domain.ReplyDTO;

public interface ReplyMapper {
	
	public int insert(ReplyDTO dto);
	
	public int update(ReplyDTO dto);
	
	public int delete(int rno);
	
	public ReplyDTO read(int rno);
	
	public List<ReplyDTO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("id") int id);

}
