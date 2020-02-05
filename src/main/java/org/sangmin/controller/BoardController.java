package org.sangmin.controller;

import org.sangmin.service.BoardService;
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
	private BoardService board;
	
	@GetMapping("/board")
	public String boardList(Model model) {
		model.addAttribute("board", board.BoardList()); 
		
		return "board";
		
	}
	
	@GetMapping("/notice")
	public String noticeList(Model model) {
		model.addAttribute("board", board.NoticeList()); 
		
		return "notice";
		
	}
	
	@GetMapping("/skill")
	public String skill() {
		
		return "skill";
	}
	
	@GetMapping ("detail")
	public String detail(int id, Model model) {
		model.addAttribute("detail",board.read(id));
		return "detail";
	}

}
