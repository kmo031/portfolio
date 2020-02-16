package org.sangmin.controller;

import org.sangmin.domain.BoardDTO;
import org.sangmin.domain.Criteria;
import org.sangmin.domain.PageDTO;
import org.sangmin.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board/*")

public class BoardController {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardService boardService;
	
	//게시판 목록 가져오기
	@GetMapping("/board")
	public void boardList(Criteria cri, Model model) {
		log.info("list :" + cri);
		//model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = boardService.getTotal(cri); //게시글 갯수 가져오기
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("board",boardService.BoardList(cri)); 
	}
	
	//공지사항 가져오기
	@GetMapping("/notice")
	public void noticeList(Criteria cri, Model model) {
		model.addAttribute("board", boardService.NoticeList(cri)); 
		
	}
	
	@GetMapping("/skill")
	public void skill() {
	}
	
	@GetMapping ("/detail")
	public void detail(int id, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("detail",boardService.read(id));
	}
	
	@PostMapping("/modify")
	public String modify(BoardDTO board, RedirectAttributes rttr) {
		
		log.info("modify:" + board);
		if(boardService.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/detail?id=" + board.getId();
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
