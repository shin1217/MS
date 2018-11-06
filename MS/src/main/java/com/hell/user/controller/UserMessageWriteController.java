package com.hell.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hell.member.model.MessageVo;
import com.hell.user.service.UserMessageWriteService;

@Controller
@RequestMapping("/user/message")
public class UserMessageWriteController {
	
	@Autowired
	private UserMessageWriteService service;
	
	@RequestMapping(method = RequestMethod.GET)
	public String messageForm() {
		
		return "user/userMessage";
		
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String writeMessage(@RequestParam("userId") String userId,
			MessageVo message) {
		
		service.write(message, userId);
		
		return "user/userMain";
	}
	
	
}
