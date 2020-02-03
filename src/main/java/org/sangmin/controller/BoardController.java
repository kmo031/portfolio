package org.sangmin.controller;

import org.sangmin.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper board;
	
	@GetMapping("/normal")
	public String boardList(Model model) {
		model.addAttribute("board", board.getBoardList()); 
		
		return "board";
		
	}
	
	@GetMapping("/notice")
	public String noticeList(Model model) {
		model.addAttribute("board", board.getNoticeList()); 
		
		return "notice";
		
	}
	
	@GetMapping("/skill")
	public String skill() {
		
		return "skill";
	}

}
