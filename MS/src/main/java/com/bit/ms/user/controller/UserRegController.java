package com.bit.ms.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/user/reg")
public class UserRegController {

	@RequestMapping(method = RequestMethod.GET)
	public String userReg() {

		return "user/userReg";
	}
}
