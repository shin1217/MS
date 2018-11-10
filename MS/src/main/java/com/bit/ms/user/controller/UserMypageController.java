package com.bit.ms.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserMyPageService;


@Controller
public class UserMypageController {
	
	@Autowired
	UserMyPageService service;
	
	@RequestMapping("/user/userMypage")
	public String userMypage(HttpSession session, Model model) {
		
		UserVO userData = (UserVO) session.getAttribute("userSession");
		
		String userId = userData.getUser_id();
		
		model.addAttribute("user",service.getMyPage(userId));
		
		return "user/userMypage";
	}
	//사용자 삭제
	@RequestMapping("/user/userDelete")
	public String delete(UserVO userVo) {
		//System.out.println(userVo);
		
		String user_id = userVo.getUser_id();
		service.deleteUser(user_id);
		
		return "user/userMypage";
	}
	//사용자 수정
	@RequestMapping(value = "/user/userEdit", method = RequestMethod.POST)
	public String edit(UserVO userVo) {
		
		service.userEdit(userVo);
		
		return "user/userMypage";
	}
}
