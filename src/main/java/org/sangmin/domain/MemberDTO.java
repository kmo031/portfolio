package org.sangmin.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberDTO {

	private String userid;
	private String userpw;
	private String userName;
	private boolean enabled;
	
	private Date regDate;
	private List<AuthDTO> authList;
}
