package com.bit.ms.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.ms.user.model.UserBoardVO;
import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserBoardWriteService;

@Controller
@RequestMapping("/user/userBoard/Write")
public class UserBoardWriteController {

	@Autowired
	private UserBoardWriteService userBoardWriteService;

	@RequestMapping(method = RequestMethod.GET)
	public String userBoardWriteForm() {

		return "user/userBoardWriteForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String userBoardWriteReg(UserBoardVO userBoardVO, HttpSession httpsession) {

		UserVO userVO = (UserVO) httpsession.getAttribute("userSession");

		userBoardVO.setStore_id(userVO.getStore_id());

		userBoardVO.setUser_id(userVO.getUser_id());

		System.out.println("userBoardVO 확인" + userBoardVO);

		userBoardWriteService.userBoardWrite(userBoardVO);

		return "redirect:/user/userBoard?page=1";
	}
}