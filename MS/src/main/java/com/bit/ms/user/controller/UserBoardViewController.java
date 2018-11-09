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

	@RequestMapping("user/userBoard/View/{uboard_id}")
	public String getUserBoardViewC(@PathVariable("uboard_id") int uboard_id, Model model) throws Exception {

		UserBoardVO userboardVO = userBoardViewService.getUserBoardViewS(uboard_id);

		int previousNUM = userBoardViewService.getViewPreviousNUM(uboard_id);

		int nextNUN = userBoardViewService.getViewNextNUM(uboard_id);

		int userBoardTotalCount = userBoardViewService.getViewTotalCount();

		if (userboardVO == null) {
			throw new Exception();
		}

		model.addAttribute("userboardvo", userboardVO);
		model.addAttribute("previousnum", previousNUM);
		model.addAttribute("nextnum", nextNUN);
		model.addAttribute("userboardtotalcount", userBoardTotalCount);

		return "user/userBoardView";

	}

}
