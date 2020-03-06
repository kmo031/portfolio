package org.sangmin.domain;

import java.io.File;
import java.sql.Date;

import lombok.Data;

@Data
public class BoardDTO {

	private int rno;
	private int id;
	private String title;
	private String type;
	private String writer_Id;
	private String content;
	private Date regdate;
	private Date updateDate;
	private int hit;
	private int replyCnt;
	
}
