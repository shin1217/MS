package com.bit.ms.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/admin")
public class AdminLoginController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String adminLogin() {
		
		return "admin/adminLogin";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String adminLoginPass(@RequestParam("admin_id") String admin_id,
			@RequestParam("admin_pw") String admin_pw, HttpSession httpSession) {
		
		
		
		
		return "redirect:/admin/main";
	}
}
