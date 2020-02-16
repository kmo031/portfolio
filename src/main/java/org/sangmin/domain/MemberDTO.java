package org.sangmin.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberDTO {

	private String userId;
	private String userPw;
	private String userName;
	private String phone;
	private boolean enabled;
	
	private Date regDate;
	private List<AuthDTO> authList;
}
