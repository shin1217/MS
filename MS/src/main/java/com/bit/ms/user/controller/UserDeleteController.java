package com.bit.ms.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserDeleteService;


@Controller
public class UserDeleteController {

	@Autowired
	private UserDeleteService service;
	
	@RequestMapping("/user/userDelete")
	public String delete(UserVO userVo) {
		System.out.println(userVo);
		
		String user_id = userVo.getUser_id();
		service.deleteUser(user_id);
		
		return "user/userMypage";
		
	}
	
}
