package com.bit.ms.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.admin.service.AdminStoreListService;
import com.bit.ms.member.model.StoreVO;
import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserMailSendService;
import com.bit.ms.user.service.UserRegService;

@Controller
public class UserRegController {

	@Autowired
	private UserRegService reg_service;
	@Autowired
	private AdminStoreListService store_service;
	@Autowired
	private UserMailSendService mailsender;
	
	
	// 회원가입 페이지에 보일 매장 리스트
	@RequestMapping(value = "/user/reg", method = RequestMethod.GET)
	public String userReg(Model model) {
		
		List<StoreVO> result = store_service.get_storeList();
		
		// 매장 리스트
		model.addAttribute("store_list", result);
		System.out.println("컨트롤러 접속 확인"+ result);
		
		return "user/userReg";
	}
	
	// 회원가입 컨트롤러
	@RequestMapping(value = "/user/reg", method = RequestMethod.POST)
	public String userRegPass(UserVO userVO, Model model) {
		// 회원가입 메서드
		reg_service.userReg_service(userVO);
		// 인증 메일 보내기 메서드
		mailsender.mailSendWithUserKey(userVO.getUser_email(), userVO.getUser_id());

		return "redirect:/";
	}

	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String user_id) {

		return reg_service.userIdCheck(user_id);
	}
	
	// e-mail 중복 체크 컨트롤러
	@RequestMapping(value = "/user/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public int emailCheck(@RequestParam("userMail") String user_email) {
		System.out.println("메일 중복체크 컨트롤러");
		return reg_service.userMailCheck(user_email);
	}
	
	// e-mail 인증 컨트롤러
	@RequestMapping(value = "/user/key_alter", method = RequestMethod.GET)
	public String key_alterConfirm(@RequestParam("user_id")String user_id,
			@RequestParam("user_key")String key) {
		
		mailsender.alter_userKey_service(user_id, key);
		
		return "user/userRegSuccess";
	}
}
