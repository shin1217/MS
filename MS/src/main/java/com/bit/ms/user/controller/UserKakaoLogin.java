package com.bit.ms.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserKakaoLogin {

	@RequestMapping(value = "/kakao_oauth", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakao_oauth(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println("code : " + code);
		
		return null;

	}
}
