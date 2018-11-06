package com.hell.interrceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 세션에 로그인 정보 유무 확인
		// -> return true : 정상적인 Controller 실행
		HttpSession session = request.getSession(false);

		if (session != null) {

			Object obj = session.getAttribute("adminVO");
			Object obj2 = session.getAttribute("userVO");
			
			if (obj != null || obj2 != null) {
				return true;
			}

		}

		response.sendRedirect("/pc");

		return false;
	}

}
