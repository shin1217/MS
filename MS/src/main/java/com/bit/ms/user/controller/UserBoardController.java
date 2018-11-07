package com.bit.ms.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserBoardController {

	@RequestMapping("/user/userBoard")
	public String userBoard() {
		
		return "user/userBoard";
	}
}
