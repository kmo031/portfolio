package org.sangmin.domain;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum; //페이지 
	private int amount; // 한페이지의 표현할 레코드갯수
	
	private String type; //검색조건 타입
	private String keyword; //검색어
	
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
}
