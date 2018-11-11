package com.bit.ms.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.admin.service.AdminLoginService;

@Controller
@RequestMapping(value="/admin")
public class AdminLoginController {
	
	@Autowired
	AdminLoginService adminLog_service;
	
	@RequestMapping(method = RequestMethod.GET)
	public String adminLogin() {
		
		return "admin/adminLogin";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public int adminLoginPass(String admin_id, String admin_pw, int store_id, HttpSession httpSession) {
		
		int result = adminLog_service.adminLogin_service(admin_id, admin_pw, store_id, httpSession);
		
		return result;
	}
}
