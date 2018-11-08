package com.bit.ms.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.ms.user.service.UserBoardModifyService;

@Controller
@RequestMapping("user/userBoard/modify/{uboard_id}")
public class UserBoardModifyController {

	@Autowired
	UserBoardModifyService userBoardModifyService;

	@RequestMapping(method = RequestMethod.GET)
	public String getUserBoardModify(@PathVariable("uboard_id") int uboard_id) {
		return "user/userBoardModfiyFrom";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String userBoardModfy(@PathVariable("uboard_id") int uboard_id) {
		return "1";
	}

}
