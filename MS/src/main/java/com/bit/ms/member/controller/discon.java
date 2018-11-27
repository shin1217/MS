package com.bit.ms.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserLoginService;

@Controller
public class discon {

	@Autowired
	private LoginManager loginManager;

	@Autowired
	private UserLoginService login_service;

	@RequestMapping("/member/discon")
	public ModelAndView beforelogout(HttpSession httpSession, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		
		String loginId = (String) httpSession.getAttribute("loginId");

		if (loginId != null) {

			// 기존의 접속(세션)을 끊는다.
			loginManager.removeSession(loginId);
			httpSession = request.getSession(true);
		}

		String user_id = request.getParameter("user_Id");
		String user_pw = request.getParameter("user_Pw");
		int store_id = Integer.parseInt(request.getParameter("store_Id"));
		String user_check = request.getParameter("remember_userId");

		System.out.println("discon : " + user_id);
		System.out.println("discon : " + user_pw);
		System.out.println("discon : " + store_id);

		int result = 0;

		UserVO userVO = new UserVO();
		userVO.setUser_id(user_id);
		userVO.setUser_pw(user_pw);

		result = login_service.userLogin_service(userVO, store_id, httpSession, user_check, response);

		mav.setViewName("user/userMain");

		loginManager.setSession(httpSession, loginId);

		return mav;
	}

}
