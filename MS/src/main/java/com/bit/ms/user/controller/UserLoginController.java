package com.bit.ms.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.user.service.UserLoginService;


@Controller
public class UserLoginController {

	@Autowired
	private UserLoginService login_service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String userLogin() {
		
		return "user/userLogin";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	@ResponseBody 			 /*String으로 받으면 자동으로 map형태로 받음 그러나 객체형태로 받는게 관리하기 편함*/
	public int userLoingPass(String user_id, String user_pw, int store_id, HttpSession httpSession, HttpServletRequest request, HttpServletResponse response) {
		
		// userLogin.jsp에서 아이디기억하기 name값(remember) 가져오기
		String check = request.getParameter("remember_id");
		int result = login_service.userLogin_service(user_id, user_pw, store_id, httpSession, check, response);
		
		
		
		return result;
	}
	
}
