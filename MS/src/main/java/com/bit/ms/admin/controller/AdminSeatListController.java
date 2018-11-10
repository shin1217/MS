package com.bit.ms.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.admin.service.AdminSeatListService;

@Controller
@RequestMapping("admin/seat")
public class AdminSeatListController {

	@Autowired
	AdminSeatListService adminSeatListService;

	public ModelAndView getAdminSeatList() {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/adminSeatList");

		return mav;

	}

}
