package com.bit.ms.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.member.model.SeatVO;
import com.bit.ms.user.service.UserTimeService;

@Controller
public class UserTimeController {
	
	@Autowired
	UserTimeService service;
	
	// 충전하기 버튼 눌렀을 시 유저 시간 충전 및 좌석 정보 업데이트 처리
	@RequestMapping(value="/user/addTime", method=RequestMethod.GET)
	@ResponseBody // 뷰 응답이 아닌 반환 타입의 데이타를 반환 (RESTContoller로 대체 가능)
	public long addTime(@RequestParam("userId") String userId,
						@RequestParam("seatId") String seatId,
						@RequestParam("addTime") long addTime,
						@RequestParam("nowTime") long nowTime){
		
		long userTime = addTime + service.getTime(userId); // 로그인한 유저의 남은 시간과 충전시간 더하기
		
		int resultCnt = service.addTime(userTime, userId); // 유저가 가지고 있는 시간 변경
		resultCnt += service.updateSeat(nowTime, userTime, userId, seatId); // 좌석 업데이트
		
		if(resultCnt == 2) {
			System.out.println("유저 시간 추가 및 좌석 업데이트 성공");
		}
		return userTime;
	}
	
	// 유저 메인 실행 시 좌석 초기화 처리
	@RequestMapping(value="/user/resetSeat", method=RequestMethod.GET)
	@ResponseBody 
	public List<SeatVO> resetSeat(@RequestParam("nowTime") long nowTime) {
		
		int resultCnt = service.updateSeatAll(nowTime);  // 사용 중인 좌석의 현재 시간 필드 업데이트
		
		if(resultCnt > 0) {
			System.out.println("사용 중인 좌석의 현재 시간 필드 업데이트 성공");
		}
		return service.getSeatInfo();
	}
	
	// 로그인한 유저의 좌석 사용 상태 검사
	@RequestMapping(value="/user/isUsingSeat", method=RequestMethod.GET)
	@ResponseBody 
	public SeatVO isUsingSeat(@RequestParam("userId") String userId) {
		
		return service.isUsingSeat(userId);
	}
	
	// 페이지 이동 시 시간 저장
	@RequestMapping(value="/user/saveTime", method=RequestMethod.GET)
	public void saveTime(@RequestParam("nowTime") long nowTime) {
		
		List<SeatVO> list = service.getSeatInfo();
		System.out.println("사용 시간 : " + (nowTime - list.get(0).getSeat_update_time()) + "분");
		
		long useTime = nowTime - list.get(0).getSeat_update_time(); // 사용 시간은 동일하므로 우선 하나만 가져옴.
			
		//좌석 테이블의 add_time 업데이트 
		service.updateSeatAddTime(useTime);
		
		//유저 테이블의 user_time에 저장
		service.updateUserAddTime(useTime);
	}
}