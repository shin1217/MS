package com.bit.ms.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserOrdersController {
	
	@RequestMapping("/user/userOrders")
	public String userOrders() {
		
		return "user/userOrders";
	}
}
