package com.hell.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hell.member.model.OrderVO;
import com.hell.user.service.OrderService;

@Controller
public class UserOrderController {
	
	@Autowired
	OrderService orderService;
	
	@ResponseBody 
	@RequestMapping(value = "/user/order", 
			produces = MediaType.APPLICATION_JSON_VALUE,
			consumes = MediaType.APPLICATION_JSON_VALUE,
			headers = "content-type=application/x-www-form-urlencoded")
	
	public void order(@RequestBody List<Map<String, Object>> list) {
		int resultOrder = 0;
		
		System.out.println(list);
		
		// RequestBody를 사용해 넘겨받은 JSON형태의 데이터를 리스트 형식으로 출력
		for (int i = 0; i < list.size(); i++) {
            
    		OrderVO order = new OrderVO();
    		order.setComId((int)list.get(i).get("userComId"));
    		order.setOrderFoodId((int)list.get(i).get("orderFoodId"));
    		order.setOrderCnt((int)list.get(i).get("orderCnt"));
            
			// 주문 테이블에 정보 저장하는 서비스 처리
			resultOrder = orderService.order(order);
			
			if(resultOrder == 0) {
				System.out.println("주문 테이블 등록 실패");
			}
			
			else {
				System.out.println("주문 테이블 등록 성공");
			}
			
        }
	}
}	
