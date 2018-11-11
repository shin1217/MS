package com.bit.ms.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.admin.service.AdminSeatListService;
import com.bit.ms.member.model.SeatVO;

@Controller
public class AdminSeatListController {

	@Autowired
	AdminSeatListService adminSeatListService;

	@RequestMapping("/admin/seat")
	public ModelAndView getAdminSeatList() {

		List<SeatVO> seatlist = adminSeatListService.getSeatListS();

		ModelAndView mav = new ModelAndView();

		mav.addObject("seatlist", seatlist);

		mav.setViewName("admin/adminSeatList");

		return mav;

	}

}
