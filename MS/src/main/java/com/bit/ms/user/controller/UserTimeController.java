package com.bit.ms.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserTimeService;

@Controller
public class UserTimeController {
	
	@Autowired
	UserTimeService service;
	
	@RequestMapping("/user/updateAddTime")
	@ResponseBody
	public void updateAddTime(@RequestParam("addTime") long addTime,
								@RequestParam("seatId") int seatId,
								@RequestParam("userId") String userId,
								@RequestParam("storeId") int storeId) {
		
		int usePay = (int)(addTime / 3600)*1000; // 충전 시간(초)를 시간으로 변환한 후 가격 계산
		
		// 좌석에 따라 추가 금액 처리
		/////////
		
		int resultCnt = service.updateAddTime(addTime, seatId, usePay, userId, storeId);
		
		if(resultCnt > 0) {
			System.out.println("유저 좌석 확정 및 시간 업데이트 성공");
		}
	}
	
	@RequestMapping("/user/getUserInfoAll")
	@ResponseBody
	public List<UserVO> getUserInfoAll(@RequestParam("storeId") int storeId) {
		return service.getUserInfoAll(storeId);
	}
}
