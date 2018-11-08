package com.bit.ms.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserAddTimeService;

@Controller
public class UserAddTimeController {
	
	@Autowired
	UserAddTimeService service;
	
	@RequestMapping(value="/user/addTime", method=RequestMethod.GET)
	@ResponseBody
	public int addTime(HttpSession session, 
						@RequestParam("addTime") long addTime){
		
		UserVO userVO =  (UserVO)session.getAttribute("userSession"); // 세션에 저장된 유저 객체 불러오기
		userVO.setUser_time(addTime+userVO.getUser_time()); // 충전할 시간과 남은 시간 더해서 변경
		session.setAttribute("userSession", userVO); // 변경된 유저 객체를 다시 세션에 저장
		
		return service.addTime(userVO.getUser_time(), userVO.getUser_id());
	}
}
