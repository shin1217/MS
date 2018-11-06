package com.hell.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hell.admin.service.AdminRegService;
import com.hell.member.model.AdminVO;
import com.hell.member.model.UserVO;
import com.hell.user.service.UserRegService;

@Controller
public class RegController {

	// 유저 서비스 autowired
	// 관리자 서비스 autowired
	@Autowired
	private AdminRegService adminRegService;
	@Autowired
	private UserRegService userRegService;

	// 메인페이지에서 회원가입 클릭
	@RequestMapping(value = "/member/reg", method = RequestMethod.GET)
	public String memberRegForm() {
		return "member/regForm";
	}

	// 회원가입 페이지에서 회원가입 클릭
	@RequestMapping(value = "/member/reg", method = RequestMethod.POST)
	public ModelAndView memberReg(
			// 체크박스는 파라미터 안넘어오면 null 이므로 오류 발생
			// 그러므로 파라미터 필수 여부 false 변경
			@RequestParam(value = "isAdmin", required = false) String isAdmin, @RequestParam("id") String id,
			@RequestParam("pw") String pw, @RequestParam("name") String name,
			@RequestParam(value = "phoneNum", required = false) String phoneNum,
			@RequestParam(value = "birth", required = false) String birth) {

		// 회원가입 페이지에서 파라미터 받아서 분기 처리
		// 아이디에 admin 포함되어 있고 관리자 여부 체크 했으면 관리자 회원가입으로 처리
		// 아니면 사용자 회원가입으로 처리

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:login");

		// Reg 결과 값
		int resultCnt = 0;

		if (isAdmin != null) {
			// 경원이형 처리
			System.out.println("관리자 계정 회원가입");

			AdminVO admin = new AdminVO();
			admin.setAdminId(id);
			admin.setAdminPw(pw);
			admin.setAdminName(name);

			resultCnt = adminRegService.adminReg(admin);

			if (resultCnt == 0) {
				mav.setViewName("fail");
			}
		}

		else {
			// 겨례형 처리
			System.out.println("사용자 계정 회원가입");

			UserVO user = new UserVO();
			user.setUserId(id);
			user.setUserPw(pw);
			user.setUserName(name);
			user.setUserPhone(phoneNum);
			user.setUserBirth(birth);

			resultCnt = userRegService.userReg(user);

			if (resultCnt == 0) {
				mav.setViewName("fail");
			}
		}

		return mav;
	}

	// ID 중복 유효성 체크하는 컨트롤러
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("id") String paramId, @RequestParam("isAdmin") boolean isAdmin) {
		System.out.println("isAdmin" + isAdmin);
		System.out.println("paramId" + paramId);
		
		int result = 0;

		if (isAdmin) {

			result = adminRegService.checkAdminId(paramId);

		} else {

			result = userRegService.checkUserId(paramId);

		}

		return result;
	}
	
	
	// userPhone 중복 체크하는 컨트롤러
	@RequestMapping(value = "/member/phoneCheck", method = RequestMethod.POST)
	@ResponseBody
	public String phoneCheck(@RequestParam("phoneNum")String phoneNum, @RequestParam("isAdmin") boolean isAdmin) {
		
		
		String result = "";
		
		// isAdmin = true -> 관리자 페이지
		if(!(isAdmin)) {
			
			result = userRegService.checkUserPhoneNum(phoneNum);
			
		}
		
		return result;
	}
	

}
