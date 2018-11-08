package com.bit.ms.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.ms.user.service.UserBoardDeleteService;

@Controller
public class UserBoardDeleteController {

	@Autowired
	private UserBoardDeleteService userBoardDeleteService;

	@RequestMapping(value = "/user/userBoard/Delete/{uboard_id}", method = RequestMethod.GET)
	public String userBoardDelete(@PathVariable("uboard_id") int uboard_id) {

		userBoardDeleteService.UserBoardDeleteS(uboard_id);

		return "redirect:/user/userBoard?page=1";
	}

}
