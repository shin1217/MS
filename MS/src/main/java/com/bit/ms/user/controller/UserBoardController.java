package com.bit.ms.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.user.model.UserBoardListVO;
import com.bit.ms.user.service.UserBoardService;

@Controller
public class UserBoardController {

	@Autowired
	private UserBoardService userBoardService;

	@RequestMapping("/user/userBoard")
	public ModelAndView userBoard(HttpServletRequest request) {

		String pageParam = request.getParameter("page");

		int pageNum = 1;

		if (pageParam != null) {
			pageNum = Integer.parseInt(pageParam);
		}

		UserBoardListVO ViewData = null;

		try {

			ViewData = userBoardService.getUserBoardList(pageNum);

		} catch (Exception e) {
			e.printStackTrace();
		}

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("user/userBoard");

		modelAndView.addObject("userboardlist", ViewData);
		
		modelAndView.addObject("pageNum", pageNum);

		return modelAndView;
	}
}