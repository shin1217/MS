package com.bit.ms.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.user.service.UserAddTimeService;

@Controller
public class UserAddTimeController {
	
	@Autowired
	UserAddTimeService service;
	
	@RequestMapping(value="/user/addTime", method=RequestMethod.GET)
	@ResponseBody
	public int addTime(@RequestParam("addTime") long addTime,
						@RequestParam("userTime") long userTime,
						@RequestParam("userId") String userId){
		
		System.out.println("남은 시간 : " + userTime);
		System.out.println("충전 시간 : " + addTime);
		System.out.println("유저 아이디 " + userId);
		
		return service.addTime((addTime+userTime), userId);
	}
}
