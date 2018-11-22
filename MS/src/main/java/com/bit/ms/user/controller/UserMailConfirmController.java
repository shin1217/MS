package com.bit.ms.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.user.service.UserMailSendService;

@Controller
public class UserMailConfirmController {

	@Autowired
	private UserMailSendService mailsender;
	
	@RequestMapping(value = "/user/regMailConfirm", method = RequestMethod.POST)
	@ResponseBody
	public String regMailConfirm(@RequestParam("user_email")String user_email) {
		
		mailsender.mailSendWithUserKey(user_email);
		
		return "ok~";
	}
	
}
