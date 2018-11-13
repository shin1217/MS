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
	
	// 관리자 메인 실행 시 사용 중인 유저 정보 모두 가져오기
	@RequestMapping(value="/admin/getUserInfoAll", method=RequestMethod.GET)
	@ResponseBody 
	public List<UserVO> getUserInfoAll() {
		return service.getUserInfoAll();
	}
	
	// 관리자 메인에서 충전하기 버튼 눌렀을 시 유저 시간 변경
	@RequestMapping(value="/admin/updateAddTime", method=RequestMethod.GET)
	@ResponseBody
	public void updateAddTime(@RequestParam("addTime") long addTime,
							@RequestParam("seatId") int seatId){
		
		int resultCnt = service.updateAddTime(addTime, seatId); // 유저 시간 업데이트 
						
		if(resultCnt > 0) {
			System.out.println("유저 시간 업데이트 성공");
		}
	}
	
	
	// 로그인한 유저의 좌석 사용 상태 검사
	/*@RequestMapping(value="/user/isUsingSeat", method=RequestMethod.GET)
	@ResponseBody 
	public UserVO isUsingSeat(@RequestParam("userId") String userId) {
		return service.isUsingSeat(userId);
	}*/
	
	// 페이지 이동 시 시간 저장
	@RequestMapping(value="/admin/updateSaveTimeAll", method=RequestMethod.GET)
	public void updateSaveTimeAll(@RequestParam("useTime") long useTime) {
		System.out.println("사용 시간 : " + useTime + "초");
		
		int resultCnt = service.updateSaveTimeAll(useTime);
		
		if(resultCnt > 0) {
			System.out.println("사용한 시간 계산 후 좌석 사용 중인 유저 시간 업데이트 성공");
		}
	}
}