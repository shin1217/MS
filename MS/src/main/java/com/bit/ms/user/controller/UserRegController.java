package com.bit.ms.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserIdCheckService;
import com.bit.ms.user.service.UserRegService;

@Controller
public class UserRegController {

	@Autowired
	private UserRegService reg_service;
	@Autowired
	private UserIdCheckService idcheck_service;

	@RequestMapping(value = "/user/reg", method = RequestMethod.GET)
	public String userReg() {

		return "user/userReg";
	}

	@RequestMapping(value = "/user/reg", method = RequestMethod.POST)
	public String userRegOk(UserVO userVO) {

		userVO.setUser_email(userVO.getUser_email1() + "@" + userVO.getUser_email2()); // 이메일 앞뒤를 합쳐줌

		reg_service.userReg_service(userVO);

		return "redirect:/";
	}

	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int IdCheck(@RequestParam("userId") String user_id) {

		return idcheck_service.userIdCheck(user_id);
	}
}
