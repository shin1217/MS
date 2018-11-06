package com.hell.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController {
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {

		System.out.println(session.getAttribute("userVO"));// 로그아웃 확인
		// 세션의 종료
		session.invalidate();

		return "redirect:/";
	}
}