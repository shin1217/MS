package com.bit.ms.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.member.model.StoreVO;
import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserRedundantLoginService;
import com.bit.ms.user.service.UserLoginService;
import com.bit.ms.user.service.UserSha256;

@Controller
public class UserLoginController {

	@Autowired
	private UserLoginService login_service;

	@Autowired
	private UserRedundantLoginService loginManager;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String userLogin(HttpSession session, Model model) {

		// 세션만료
		session.invalidate();

		// 매장 리스트
		List<StoreVO> result = login_service.getStoreOption();
		model.addAttribute("store_list2", result);

//		System.out.println("UserLoginController // 현재 접속자 수 : " + loginManager.getUserCount());

		return "user/userLogin";
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	@ResponseBody
	public int userLoingPass(UserVO userVO, int store_id, HttpSession httpSession, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		// userLogin.jsp에서 아이디기억하기 name값(remember) 가져오기
		String user_check = request.getParameter("remember_userId");

		// 비밀번호 암호화
		String user_pw = userVO.getUser_pw();
		userVO.setUser_pw(UserSha256.encrypt(user_pw));

		// 암호화 확인
		System.out.println(userVO.getUser_pw());
		// 로그인 메서드
		int result = login_service.userLogin_service(userVO, store_id, httpSession, user_check, response);

		// 매장 리스트
		login_service.getStoreOption();

		model.addAttribute("store_list2", login_service.getStoreOption());

		return result;
	}

	@RequestMapping(value = "/userRegSuccess", method = RequestMethod.GET)
	public String user() {

		return "user/userRegSuccess";
	}

	@RequestMapping(value = "user/qrLogin")
	public String qrLogin() {

		return "user/qrLogin";
	}

	@RequestMapping(value = "/user/chkTime/{id}")
	public @ResponseBody long getUserTime(@PathVariable("id") String user_id) {

		return login_service.getUserTimeS(user_id);
	}

}
