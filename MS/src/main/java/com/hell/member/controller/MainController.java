package com.hell.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	
	// 로그인 페이지에서 로그인 요청 시 
	@RequestMapping("/member/main")
	public String mainPage(@RequestParam("isAdmin") boolean isAdmin, HttpSession session) {
		
		System.out.println("관리자 로그인 여부: " + isAdmin);
		
		String viewPage = "user/userMain";
		
		// 세션에 정보 저장
		session.setAttribute("isAdmin", isAdmin);
		
		if(isAdmin) {
			viewPage = "admin/adminMain";
		}
		
		return viewPage;
	}
}
