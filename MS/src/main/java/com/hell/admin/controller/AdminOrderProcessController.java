package com.hell.admin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hell.admin.service.AdminOrderProcessService;

@Controller
public class AdminOrderProcessController {

	@Autowired
	AdminOrderProcessService adminOrderProcessService;
	
	@RequestMapping(value ="/admin/orderProcess/{comId}", method = RequestMethod.GET)
	public String orderProcess(@PathVariable("comId") int comId) {
		
		int resultCnt = adminOrderProcessService.orderProcess(comId);
		
		if(resultCnt == 0) {
			System.out.println("음식 리스트 삭제 실패");
		}
		
		else {
			System.out.println("음식 리스트 삭제 성공");
		}
		
		return "admin/adminMain";
	}
}
