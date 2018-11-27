package com.bit.ms.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.member.controller.LoginManager;
import com.bit.ms.member.model.StoreVO;
import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserLoginService;

@Controller
public class UserLoginController {

	@Autowired
	private UserLoginService login_service;
	
	@Autowired
	private LoginManager loginManager; 

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String userLogin(HttpSession session, Model model) {

		// 로그인 세션 제거
		session.invalidate();

		// 매장 리스트
		List<StoreVO> result = login_service.getStoreOption();
		model.addAttribute("store_list2", result);
		
		System.out.println("현재 접속자 수 : " + loginManager.getUserCount());

		return "user/userLogin";
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	@ResponseBody
	public int userLoingPass(UserVO userVO, int store_id, HttpSession httpSession, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		// userLogin.jsp에서 아이디기억하기 name값(remember) 가져오기
		String user_check = request.getParameter("remember_userId");
		int result = login_service.userLogin_service(userVO, store_id, httpSession, user_check, response);

		// 매장 리스트
		login_service.getStoreOption();
		
		 //접속자 아이디를 세션에 담는다.
        httpSession.setAttribute("loginId", userVO.getUser_id());
		
		//이미 접속한 아이디인지 체크한다.		
        System.out.println(userVO.getUser_id());
		System.out.println(loginManager.isUsing(userVO.getUser_id()));
        loginManager.printloginUsers(); // 접속자 리스트
        if(loginManager.isUsing(userVO.getUser_id())){
        	result = -3;
        }
        
        loginManager.setSession(httpSession, userVO.getUser_id());
		
		model.addAttribute("store_list2", login_service.getStoreOption());

		return result;
	}
	
	@RequestMapping(value = "/userRegSuccess", method = RequestMethod.GET)
	public String user() {

		return "user/userRegSuccess";
	}

}
