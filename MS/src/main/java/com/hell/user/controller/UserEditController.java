package com.hell.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hell.member.model.UserVO;
import com.hell.user.service.UserEditService;

@Controller
public class UserEditController {
	
	@Autowired
	private UserEditService service;
	
	@RequestMapping(value = "/user/userEdit", method = RequestMethod.POST)
	public String edit(UserVO userVO) {
		
		service.editUser(userVO);
		
		return "user/myPage"; 
		
	}

}
