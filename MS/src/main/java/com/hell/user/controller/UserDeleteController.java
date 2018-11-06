package com.hell.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hell.member.model.UserVO;
import com.hell.user.service.UserDeleteService;

@Controller
public class UserDeleteController {
	
	@Autowired
	private UserDeleteService serivce;
	
	@RequestMapping(value = "/user/userDelete", method = RequestMethod.POST)
	public String delete(UserVO userVO) {
		System.out.println(userVO);
		
		String userId = userVO.getUserId();
		
		System.out.println(userId);
		serivce.deleteUser(userId);
		
		return "user/myPage";
	}
}
