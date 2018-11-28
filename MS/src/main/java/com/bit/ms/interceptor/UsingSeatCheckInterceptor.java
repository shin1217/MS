package com.bit.ms.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bit.ms.user.service.UserTimeService;

public class UsingSeatCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	UserTimeService service;
	
/*	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 좌석 사용 여부 검사
		// -> return true : 정상적인 Controller 실행
		HttpSession session = request.getSession(false);

		if (session != null) {
			
			
		}
		response.sendRedirect(request.getContextPath() + "/user/main"); // 좌석 미 등록 시 메인페이지로 이동
		return false;
	}*/
}
