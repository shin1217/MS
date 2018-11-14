package com.bit.ms.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserTimeController {

	@RequestMapping("/user/updateAddTime")
	public void updateAddTime(@RequestParam("userId") String userId,
								@RequestParam("seatId") int seatId) {
		
	}
}
