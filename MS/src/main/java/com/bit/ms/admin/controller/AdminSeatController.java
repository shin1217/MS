package com.bit.ms.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.admin.service.AdminSeatService;
import com.bit.ms.member.model.SeatVO;

@Controller
public class AdminSeatController {

	@Autowired
	AdminSeatService adminSeatService;

	@RequestMapping("/admin/seat")
	public ModelAndView getAdminSeatList() {// 좌석관리 리스트

		List<SeatVO> seatlist = adminSeatService.getSeatListS();

		ModelAndView mav = new ModelAndView();

		mav.addObject("seatlist", seatlist);

		mav.setViewName("admin/adminSeatList");

		return mav;

	}

}
