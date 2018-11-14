package com.bit.ms.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserSearchController {

	@RequestMapping(value = "/user/userSearch", method = RequestMethod.GET)
	public String userSearch() {

		return "user/userSearch";
	}
}
