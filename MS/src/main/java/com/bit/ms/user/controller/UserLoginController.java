package com.bit.ms.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.ms.user.service.UserLoginService;


@Controller
public class UserLoginController {

	@Autowired
	private UserLoginService login_service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String userLogin() {
		
		return "user/userLogin";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String userLoingPass(@RequestParam("user_id") String user_id,
			@RequestParam("user_pw") String user_pw, HttpSession httpSession) {
		
		login_service.userLogin_service(user_id, user_pw, httpSession);
		
		System.out.println("컨트롤러 세션 확인 " + httpSession.getAttribute("userVO"));
		
		
		return "redirect:/user/main";
	}
	
}
