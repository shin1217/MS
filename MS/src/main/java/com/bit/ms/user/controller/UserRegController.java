package com.bit.ms.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.user.service.UserIdCheckService;

@Controller
public class UserRegController {

	@Autowired
	private UserIdCheckService idcheckService;
	
	@RequestMapping(value = "/user/reg", method = RequestMethod.GET)
	public String userReg() {

		return "user/userReg";
	}
	
	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int IdCheck(@RequestParam("userId")String user_id) {
		
		return idcheckService.userIdCheck(user_id);
	}
}
