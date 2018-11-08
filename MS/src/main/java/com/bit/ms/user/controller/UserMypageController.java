package com.bit.ms.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserMyPageService;


@Controller
public class UserMypageController {
	
	@Autowired
	UserMyPageService service;
	
	@RequestMapping("/user/userMypage")
	public String userMypage(HttpSession session, Model model) {
		
		UserVO userData = (UserVO) session.getAttribute("userVO");
		
		String userId = userData.getUser_id();
		
		model.addAttribute("user",service.getMyPage(userId));
		
		return "user/userMypage";
	}
}
