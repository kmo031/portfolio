package org.sangmin.controller;

import org.sangmin.domain.MemberDTO;
import org.sangmin.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	@GetMapping("/signup")
	public void signUp() {
		
	}
	@PostMapping("/register")
	public String register(MemberDTO member, RedirectAttributes rttr) {
		
		service.registerUser(member);
		
		rttr.addFlashAttribute("result", member.getUserName());
		
		return "redirect:/";
		
	}
	
	@GetMapping("/idcheck")
	@ResponseBody
	public int userIdChack(@RequestParam("userId") String userId) {
		log.info("id체크");
		
		return service.idCheck(userId);
		
	}
	
	

}
