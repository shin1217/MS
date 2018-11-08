package com.bit.ms.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.ms.member.model.UserVO;
import com.bit.ms.user.service.UserEditService;


@Controller
public class UserEditController {

	@Autowired
	private UserEditService Service;
	
	@RequestMapping(value = "/user/userEdit", method = RequestMethod.POST)
	public String edit(UserVO userVo) {
		
		Service.userEdit(userVo);
		
		return "user/userMypage";
	}
	
}
