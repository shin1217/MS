package com.bit.ms.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserRedundantLoginService;
import com.bit.ms.user.service.UserLoginService;
import com.bit.ms.user.service.UserSha256;

@Controller
public class UserRedundantLoginController {

	@Autowired
	private UserRedundantLoginService loginManager;

	@Autowired
	private UserLoginService login_service;

	@RequestMapping("/member/discon")
	public ModelAndView beforelogout(HttpSession httpSession, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();

		String loginId = (String) httpSession.getAttribute("loginId");

		if (loginId != null) {
			// 기존의 접속(세션)을 끊는다.
			loginManager.removeSession(loginId);

			// 새로운 새션생성
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
		userVO.setUser_pw(UserSha256.encrypt(user_pw)); // 비밀번호 암호화

		System.out.println("로그인 객체 확인 : " + userVO);

		result = login_service.userLogin_service(userVO, store_id, httpSession, user_check, response);
		System.out.println("로그인 확인 : " + result);
		if (result == 1) {
			System.out.println("먼저 로그인 해제하고 나중로그인 실행");
			mav.setViewName("user/userMain");
		} else {
			System.out.println("중복로그인 실패");
			mav.setViewName("redirect:/");
		}
		loginManager.setSession(httpSession, loginId);

		return mav;
	}

}
