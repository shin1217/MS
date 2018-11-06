package com.hell.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hell.member.model.UTimeVO;
import com.hell.member.model.UserVO;
import com.hell.user.service.UserTimeService;

@Controller
public class UserTimeController {

	@Autowired
	private UserTimeService userTimeService;

	@RequestMapping("/user/addTime")
	public @ResponseBody UTimeVO addTime(@RequestParam("comId") int comId, @RequestParam("addTime") long addTime,
			HttpSession session) {

		System.out.println("from UserTimeController // 컨트롤러 시작");

		UserVO userVo = (UserVO) session.getAttribute("userVO"); // 로그인 후 세션 정보 가져옴

		System.out.println("from UserTimeController // 로그인 유저 정보 : " + userVo);

		long remainTime = (addTime * 60) + userVo.getUserTime(); // 남은 시간 계산

		userVo.setUserTime(remainTime);// 세션 수정전 남은시간 더하기
		session.setAttribute("userVO", userVo);// 세션 수정

		System.out.println("from UserTimeController // 유저가 가지고 있는 시간(분) : " + userVo.getUserTime());
		System.out.println("from UserTimeController // 충전 시간(분) : " + (addTime * 60));
		System.out.println("from UserTimeController // 충전 후 시간(분) : " + remainTime);

		UTimeVO uTime = new UTimeVO();// Utime테이블에 보낼 객체 생성

		uTime.setUserId(userVo.getUserId()); // 세션의 유저 아이디 저장
		uTime.setComId(comId); // 컴퓨터 번호 저장
		uTime.setUserTime(remainTime); // 남은 시간 저장

		// service, dao 처리 하십쇼

		System.out.println("from UserTimeController // 컨트롤러 중간");

		try {
			// UTime테이블
			int UTimeResultCnt = userTimeService.UTimeChargeService(userVo.getUserId(), comId, remainTime);

			if (UTimeResultCnt == 1) {
				System.out.println("from UserTimeController // UTime 테이블 등록 성공");
			} else {
				System.out.println("from UserTimeController // UTime 테이블 등록 실패");
			}

			// User테이블
			int UserResultCnt = userTimeService.UserChargeService(userVo.getUserId(), comId);

			if (UserResultCnt == 1) {
				System.out.println("from UserTimeController // User 테이블 등록 성공");
			} else {
				System.out.println("from UserTimeController // User 테이블 등록 실패");
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("from UserTimeController // 컨트롤러 끝");

		return uTime; // 요청한 페이지에 JSON 객체로 리턴
	}
}