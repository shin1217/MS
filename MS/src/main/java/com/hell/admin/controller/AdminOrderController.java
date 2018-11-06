package com.hell.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hell.admin.service.AdminOrderFoodService;
import com.hell.admin.service.AdminOrderService;
import com.hell.member.model.FoodVO;
import com.hell.member.model.OrderFoodVO;
import com.hell.member.model.OrderVO;

@Controller
public class AdminOrderController {
	
	@Autowired
	AdminOrderService adminOrderService;
	
	@Autowired
	AdminOrderFoodService adminOrderFoodService;
	
	@RequestMapping("/admin/order")
	public @ResponseBody List<OrderFoodVO> order() {
		
		List<OrderVO> list = adminOrderService.getOrderList(); // 주문 정보 가져온 객체
		List<OrderFoodVO> orderList = new ArrayList<OrderFoodVO>(); // 뷰에 뿌려줄 주문+음식 정보 리스트 객체
		
		for(int i=0; i<list.size(); i++) {
			System.out.println("주문한 음식 번호" + list.get(i).getOrderFoodId());
			
			// 뷰에 객체로 한번에 뿌려주기 위해 만들어준 객체
			OrderFoodVO orderFoodVO = new OrderFoodVO();
			
			// 주문정보의 아이디를 기반으로 음식 테이블에서 음식 정보 가져오기
			FoodVO foodVO = adminOrderFoodService.getOderFoodList(list.get(i).getOrderFoodId());
			
			System.out.println("음식 정보" + foodVO);
			
			orderFoodVO.setOrderId(list.get(i).getOrderId());
			orderFoodVO.setComId(list.get(i).getComId()); // 컴퓨터 번호
			orderFoodVO.setFoodId(list.get(i).getOrderFoodId()); // 음식 번호
			orderFoodVO.setFoodName(foodVO.getFoodName()); // 음식 이름
			orderFoodVO.setTotalPrice(foodVO.getFoodPrice()); // 음식 가격
			orderFoodVO.setFoodCnt(list.get(i).getOrderCnt()); // 음식 이름
			
			System.out.println(orderFoodVO);
			
			orderList.add(orderFoodVO);
		}
		
		System.out.println("주문 대기 정보" + orderList);
		
		return orderList; //JSON 객체로 리턴
	}
}
