package org.sangmin.controller;

import org.sangmin.domain.BoardDTO;
import org.sangmin.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board/*")

public class BoardController {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardService boardService;
	
	@GetMapping("/board")
	public void boardList(Model model) {
		model.addAttribute("board", boardService.BoardList()); 
	}
	
	@GetMapping("/notice")
	public void noticeList(Model model) {
		model.addAttribute("board", boardService.NoticeList()); 
		
	}
	
	@GetMapping("/skill")
	public void skill() {
	}
	
	@GetMapping ("/detail")
	public void detail(int id, Model model) {
		model.addAttribute("detail",boardService.read(id));
	}
	
	@PostMapping("/modify")
	public String modify(BoardDTO board, RedirectAttributes rttr) {
		
		log.info("modify:" + board);
		if(boardService.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/" + board.getType();
	}
	@GetMapping("/modify")
	public void modify(Model model,int id) {
		
		model.addAttribute("board", boardService.read(id));
	}
	
	
	@PostMapping("/remove")
	public String remove(BoardDTO board, RedirectAttributes rttr) {
		
		log.info("remove ... " + board.getId());
		if(boardService.remove(board.getId())){
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/" + board.getType(); 
		
		
		
	}
	@GetMapping("/remove")
	public void remove(int id) {
		
	}
	@PostMapping("/register")
	public String create(BoardDTO board, RedirectAttributes rttr) {
		
		log.info("register :" + board);
		
		boardService.register(board);
		
		rttr.addFlashAttribute("result", board.getId());
		
		return "redirect:/board/detail?id="+ board.getId();
		
	}
	@GetMapping("/register")
	public void create() {		
	}

}
