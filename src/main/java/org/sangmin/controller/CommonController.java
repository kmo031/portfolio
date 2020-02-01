package org.sangmin.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;


// 보안, 로그인 관련 컨트롤러


@Controller
@Log4j
public class CommonController {
	
	//사용자 권한이 다를 경우 디나이 페이지 표시
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied :" + auth);
		
		model.addAttribute("msg", "Access Denied");
	}
	
	//로그인 동작 관련 맵핑
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login ErrorCheck Your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!");
		}
		
	}
	
	//로그아웃 맵핑
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom logout");
	}
	
	//로그아웃 처리 맵핑
	@PostMapping("/customLogout")
	public void logoutPOST() {
		log.info("custom logout");
	}
}
