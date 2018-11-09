package com.bit.ms.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.member.model.SeatVO;
import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserAddTimeService;

@Controller
public class UserAddTimeController {
	
	@Autowired
	UserAddTimeService service;
	
	// 충전하기 버튼 눌렀을 시 유저 시간 충전 및 좌석 정보 업데이트 처리
	@RequestMapping(value="/user/addTime", method=RequestMethod.GET)
	@ResponseBody // 뷰 응답이 아닌 반환 타입의 데이타를 반환 (RESTContoller로 대체 가능)
	public long addTime(HttpSession session, 
						@RequestParam("addTime") long addTime,
						@RequestParam("seatId") String seatId){
		
		UserVO userVO =  (UserVO)session.getAttribute("userSession"); // 세션에 저장된 유저 객체 불러오기(로그인한 아이디 사용)
		long userTime = addTime + service.getTime(userVO.getUser_id()); // 로그인한 유저의 남은 시간과 충전시간 더하기
		
		int resultCnt = service.addTime(userTime, userVO.getUser_id()); // 유저가 가지고 있는 시간 변경
		resultCnt += service.updateSeat(userTime, userVO.getUser_id(), seatId); // 좌석 업데이트
		
		if(resultCnt == 2) {
			System.out.println("유저 시간 추가 및 좌석 업데이트 성공");
		}
		return userTime;
	}
	
	// 유저 메인 실행 시 좌석 초기화 처리
	@RequestMapping(value="/user/resetSeat", method=RequestMethod.GET)
	@ResponseBody 
	public List<SeatVO> resetSeat() {
		
		return service.getSeatInfo();
	}
}
