package com.bit.ms.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.admin.service.AdminProductService;
import com.bit.ms.member.model.FoodVO;

@Controller
public class AdminOrdersController {
	
	@Autowired
	AdminProductService service;
	
	@RequestMapping("/admin/adminOrders")
	public String adminOrders() {
		
		return "admin/adminOrders";
	}
	
	@RequestMapping("/admin/insertFood")
	@ResponseBody
	public void insertFood(FoodVO foodVO, @RequestParam("foodType") String foodType) {
		foodVO.setFood_type(foodType); // 상품 타입 저장
		int resultCnt = service.insertFood(foodVO);
		
		if(resultCnt == 1) {
			System.out.println("음식 추가 성공");
		}
	}
	
	@RequestMapping("/admin/getFoodInfoAll")
	@ResponseBody
	public List<FoodVO> getFoodInfoAll(@RequestParam("storeId") int storeId){
		return service.getFoodInfoAll(storeId);
	}
	
	@RequestMapping("/admin/deleteFood")
	@ResponseBody
	public void deleteProduct(@RequestParam("storeId") int storeId, 
								@RequestParam("foodId") int foodId) {
		
		int resultCnt = service.deleteFood(foodId, storeId);
		
		if(resultCnt == 1) {
			System.out.println("음식 삭제 성공");
		}
	}
}
