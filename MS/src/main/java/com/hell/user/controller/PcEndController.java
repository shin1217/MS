package com.hell.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hell.member.model.UserVO;
import com.hell.user.service.UserTimeService;

@Controller
public class PcEndController {

	@Autowired
	private UserTimeService userTimeService;

	// 메인페이지에서 로그인 클릭
	@RequestMapping("/member/endtime")
	public String PcEndTime(HttpSession session) {

		System.out.println("from PcEndTimeController // 컨트롤러 시작");

		UserVO userVO = (UserVO) session.getAttribute("userVO");
		System.out.println("from PcEndTimeController // 세션에서 받아옴 " + userVO);

		try {

			// User테이블
			int UserResultCnt = userTimeService.endTimeReg(userVO);

			if (UserResultCnt == 1) {
				System.out.println("from PcEndTimeController.endTimeReg // User 테이블 남은시간 등록 성공");
			} else {
				System.out.println("from EndTimeController.endTimeReg // User 테이블 남은시간 등록 실패");
			}

			// UTime테이블
			int UTimeResultCnt = userTimeService.resetReg(userVO);

			if (UTimeResultCnt == 1) {
				System.out.println("from PcEndTimeController.resetReg // UTime 테이블 남은시간 등록 성공");
			} else {
				System.out.println("from PcEndTimeController.resetReg // UTime 테이블 남은시간 등록 실패");
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("from PcEndTimeController // 컨트롤러 끝");

		return "redirect:/member/logout";

	}
}
