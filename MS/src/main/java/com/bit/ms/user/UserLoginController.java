package com.bit.ms.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class UserLoginController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String userLogin() {
		
		return "user/userLogin";
	}
	
}
