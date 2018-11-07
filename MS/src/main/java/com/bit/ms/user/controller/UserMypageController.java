package com.bit.ms.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserMypageController {
	
	@RequestMapping("/user/userMypage")
	public String userMypage() {
		
		return "user/userMypage";
	}
}
