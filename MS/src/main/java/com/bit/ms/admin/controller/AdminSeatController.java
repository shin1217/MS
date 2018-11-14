package com.bit.ms.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.bit.ms.admin.service.AdminSeatService;
import com.bit.ms.member.model.SeatVO;

@RestController
public class AdminSeatController {

	@Autowired
	AdminSeatService adminSeatService;

	@RequestMapping(value = "/admin/seat", method = RequestMethod.GET)
	public ModelAndView getAdminSeat() {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/adminSeatList");

		return mav;
	}

	@RequestMapping(value = "/admin/seat/list", method = RequestMethod.GET)
	public List<SeatVO> getAdminSeatList() {// 좌석관리 리스트
		List<SeatVO> seatlist = adminSeatService.getSeatListS();
		return seatlist;
	}

	@RequestMapping(value = "/admin/seat", method = RequestMethod.POST)
	public void addSeat(SeatVO seatVO) {// 좌석 추가
		adminSeatService.addSeatS(seatVO);
	}

	@RequestMapping(value = "/admin/seat/{seat_id}", method = RequestMethod.DELETE)
	public void deleteSeat(@PathVariable("seat_id") int seat_id) { // 좌석 삭제
		adminSeatService.deleteSeatS(seat_id);
	}

	@RequestMapping(value = "/admin/seat/{seat_id}", method = RequestMethod.PUT)
	public void modifySeat(@RequestBody SeatVO seatVO) { // 좌석 수정

		adminSeatService.modifySeatS(seatVO);
	}

}
