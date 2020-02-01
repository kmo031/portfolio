package org.sangmin.controller;

import org.sangmin.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.Setter;

@RequestMapping("/notice/*")
@Controller
public class NoticeController {
	
	@Setter(onMethod_ = {@Autowired})
	private NoticeMapper notice;
	
	
	@GetMapping("/detail")  // get방식만 가능
	public String detail(@RequestParam("id") String id, Model model) {
		
		
		model.addAttribute("notice", notice.read(id));
		
		return "detail";
	}

}
