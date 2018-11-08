package com.bit.ms.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.user.model.UserBoardVO;
import com.bit.ms.user.service.UserBoardViewService;

@Controller
public class UserBoardViewController {

	@Autowired
	private UserBoardViewService userBoardViewService;

	@RequestMapping("user/userBoardView/{uboard_id}")
	public String getUserBoardViewC(@PathVariable("uboard_id") int uboard_id, Model model) throws Exception {

		UserBoardVO userboardVO = userBoardViewService.getUserBoardViewS(uboard_id);

		if (userboardVO == null) {
			throw new Exception();
		}

		model.addAttribute("userboardvo", userboardVO);

		return "user/userBoardView";

	}

}
