package com.bit.ms.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public int adminLoginPass(String admin_id, String admin_pw, HttpSession httpSession, HttpServletRequest request, HttpServletResponse response) {
		
		String admin_check = request.getParameter("remember_adminId");
		System.out.println("controller" + admin_id);
		int result = adminLog_service.adminLogin_service(admin_id, admin_pw, admin_check, response, httpSession);
		
		return result;
	}
}
