package org.sangmin.mapper;

import org.sangmin.domain.NoticeDTO;
import java.util.List;

public interface NoticeMapper {
	
	List<NoticeDTO> getList(); //공지사항 목록 가져오기
	
	NoticeDTO read(String id);     //공지사항 id에 맞는 정보 가져오기
	
	String getTime();

}
