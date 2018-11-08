package com.bit.ms.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserAddTimeController {
	
	@RequestMapping(value="/user/addTime", method=RequestMethod.GET)
	@ResponseBody
	public int addTime(@RequestParam("seatId") String seatId, 
						@RequestParam("addTime") String addTime) {
		
		System.out.println(seatId);
		System.out.println(addTime);
		
		
		
		
		return 1;
	}
}
