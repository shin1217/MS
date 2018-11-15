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

import com.bit.ms.member.model.StoreVO;
import com.bit.ms.user.service.UserLoginService;

@Controller
public class UserLoginController {

	@Autowired
	private UserLoginService login_service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String userLogin(HttpSession session, Model model) {
		
		// 로그인 세션 제거
		session.invalidate();
		
		// 매장 리스트
		List<StoreVO> result = login_service.getStoreOption();		
		model.addAttribute("store_list2", result);
		System.out.println("로그인 컨트롤러 확인"+result);
		
		return "user/userLogin";
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	@ResponseBody /* String으로 받으면 자동으로 map형태로 받음 그러나 객체형태로 받는게 관리하기 편함 */
	public int userLoingPass(String user_id, String user_pw, int store_id, HttpSession httpSession,
			HttpServletRequest request, HttpServletResponse response, Model model) {

		// userLogin.jsp에서 아이디기억하기 name값(remember) 가져오기
		String user_check = request.getParameter("remember_userId");
		System.err.println(user_check);
		int result = login_service.userLogin_service(user_id, user_pw, store_id, httpSession, user_check, response);

		// 매장 리스트
		login_service.getStoreOption();		
		model.addAttribute("store_list2", login_service.getStoreOption());
		System.out.println("로그인 컨트롤러 확인"+result);
		
		return result;
	}

}
