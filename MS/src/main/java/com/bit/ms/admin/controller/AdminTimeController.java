package com.bit.ms.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.admin.service.AdminTimeService;
import com.bit.ms.user.model.UserVO;

@Controller
public class AdminTimeController {
	
	@Autowired
	AdminTimeService service;
	
	// 충전하기 버튼 눌렀을 시 유저 시간 변경
	@RequestMapping(value="/user/addTime", method=RequestMethod.GET)
	@ResponseBody
	public void addTime(@RequestParam("userId") String userId,
						@RequestParam("seatId") int seatId,
						@RequestParam("addTime") long addTime){
		
		int resultCnt = service.updateUserAddTime(addTime, seatId, userId); // 유저 시간 업데이트 
						
		if(resultCnt > 0) {
			System.out.println("유저 시간 업데이트 성공");
		}
	}
	
	// 유저 메인 실행 시 좌석 초기화 처리
	@RequestMapping(value="/user/resetSeat", method=RequestMethod.GET)
	@ResponseBody 
	public List<UserVO> resetSeat() {
		return service.getUserInfoAll();
	}
	
	// 로그인한 유저의 좌석 사용 상태 검사
	@RequestMapping(value="/user/isUsingSeat", method=RequestMethod.GET)
	@ResponseBody 
	public UserVO isUsingSeat(@RequestParam("userId") String userId) {
		return service.isUsingSeat(userId);
	}
	
	// 페이지 이동 시 시간 저장
	@RequestMapping(value="/user/saveTime", method=RequestMethod.GET)
	public void saveTime(@RequestParam("useTime") long useTime) {
		System.out.println("사용 시간 : " + useTime + "초");
		
		int resultCnt = service.updateUserAddTimeAll(useTime);
		
		if(resultCnt > 0) {
			System.out.println("사용한 시간 계산 후 좌석 사용 중인 유저 시간 업데이트 성공");
		}
	}
}