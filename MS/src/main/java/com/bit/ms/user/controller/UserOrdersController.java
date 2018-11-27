package com.bit.ms.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.member.model.FoodVO;
import com.bit.ms.user.model.UserOrdersVO;
import com.bit.ms.user.service.UserOrdersService;

@Controller
public class UserOrdersController {

	@Autowired
	UserOrdersService service;

	@RequestMapping("/user/userOrders")
	public String userOrders() {
		return "user/userOrders";
	}

	@RequestMapping("/user/getMenuList")
	@ResponseBody
	public List<FoodVO> getMenuList(@RequestParam("foodType") String foodType,
			@RequestParam("storeId") int storeId) {
		return service.getFoodInfo(foodType, storeId);
	}

	@RequestMapping("/user/orders")
	@ResponseBody
	public void orders(@RequestBody List<Map<String, Object>> ordersList,
						@RequestParam("storeId") int storeId) {
		String sb1 = "";
		String sb2 = "";
		String sb3 = "";
		
		for (int i = 0; i < ordersList.size(); i++) {
			sb1 += ((String)(ordersList.get(i).get("foodType")) + ",");
			sb2 += ((Integer)(ordersList.get(i).get("foodId")) + ",");
			sb3 += ((String)(ordersList.get(i).get("foodCnt")) + ",");
		}
		
		UserOrdersVO ordersVO = new UserOrdersVO();
		ordersVO.setFood_type(sb1);
		ordersVO.setFood_id(sb2);
		ordersVO.setFood_cnt(sb3);
		ordersVO.setStore_id(storeId);
		
		int resultCnt = service.inserOrders(ordersVO);
		
		if(resultCnt == 1) {
			System.out.println("주문 완료");
		}
	}
}
