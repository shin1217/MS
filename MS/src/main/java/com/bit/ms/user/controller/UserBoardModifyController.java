package com.bit.ms.user.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.user.model.UserBoardVO;
import com.bit.ms.user.service.UserBoardModifyService;
import com.bit.ms.user.service.UserBoardViewService;

@Controller
@RequestMapping("user/userBoard/modify/{uboard_id}")
public class UserBoardModifyController {

	@Autowired
	private UserBoardViewService userBoardViewService;

	@Autowired
	private UserBoardModifyService userBoardModifyService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getUserBoardModify(@PathVariable("uboard_id") int uboard_id) {

		UserBoardVO userBoardVO = userBoardViewService.getUserBoardViewS(uboard_id);

		ModelAndView mav = new ModelAndView();

		mav.addObject("userboardvo", userBoardVO);

		mav.setViewName("user/userBoardModifyForm");

		return mav;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String userBoardModfy(@PathVariable("uboard_id") int uboard_id, UserBoardVO userBoardVO, Model model,
			@Param("page") int page) {

		int resultCnt = 0;

		try {
			resultCnt = userBoardModifyService.UserBoardModifyS(userBoardVO);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return "redirect:/user/userBoard/View/" + uboard_id + "?page=" + page;
	}

}
