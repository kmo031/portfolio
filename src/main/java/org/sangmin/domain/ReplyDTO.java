package org.sangmin.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {

	private int rno;
	private int id;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
}
