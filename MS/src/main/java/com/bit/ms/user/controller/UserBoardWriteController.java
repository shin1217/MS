package com.bit.ms.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.ms.user.model.UserBoardVO;
import com.bit.ms.user.service.UserBoardService;
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
	public String userBoardWriteReg(UserBoardVO userBoardVO) {
		System.out.println("userBoardVO 확인" + userBoardVO);

		userBoardWriteService.userBoardWrite(userBoardVO);

		return "redirect:/user/userBoard?page=1";
	}
}