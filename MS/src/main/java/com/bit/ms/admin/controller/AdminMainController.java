package com.bit.ms.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/admin/main")
public class AdminMainController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String adminMain() {
		
		return "admin/adminMain";
	}
}
