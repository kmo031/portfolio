package org.sangmin.controller;

import java.util.Locale;

import org.sangmin.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	

	
	
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper board;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	
		model.addAttribute("Board", board.getBoardList());
		model.addAttribute("Notice", board.getNoticeList());
		
		return "home";
	}
	
	
	
}
