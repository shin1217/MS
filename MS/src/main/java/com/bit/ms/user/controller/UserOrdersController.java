package com.bit.ms.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.user.model.UserFoodVO;
import com.bit.ms.user.service.UserOrdersService;

@Controller
public class UserOrdersController {
	
	@Autowired
	UserOrdersService service;
	
	@RequestMapping("/user/userOrders")
	public String userOrders() {
		return "user/userOrders";
	}

	@RequestMapping("/user/menu")
	@ResponseBody
	public List<UserFoodVO> getMenuList(@RequestParam("menu") String menu, @RequestParam("storeId") int storeId) {
		return service.getFoodInfo(menu, storeId);
	}
}
