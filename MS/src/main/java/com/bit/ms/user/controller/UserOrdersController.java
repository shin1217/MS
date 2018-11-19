package com.bit.ms.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserOrdersController {

	@RequestMapping("/user/userOrders")
	public String userOrders() {

		return "user/userOrders";
	}

	@RequestMapping("/user/menu")
	@ResponseBody
	public int getMenuList(@RequestParam("menu") int menu) {
		int result = 0;

		if (menu == 1) {
			result = 1;
		}

		else if (menu == 2) {
			result = 2;
		}

		else if (menu == 3) {
			result = 3;
		}

		else if (menu == 4) {
			result = 4;
		}
		
		else if (menu == 5) {
			result = 5;
		}
		return result;
	}
}
