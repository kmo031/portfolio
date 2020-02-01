package org.sangmin.domain;

import java.io.File;
import java.sql.Date;

import lombok.Data;

@Data
public class NoticeDTO {

	private int id;
	private String title;
	private String writer_Id;
	private String content;
	private Date regdate;
	private int hit;
	private File files;
	
}
