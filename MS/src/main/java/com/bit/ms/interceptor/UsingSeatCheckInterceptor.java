package com.bit.ms.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bit.ms.member.model.SeatVO;
import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserTimeService;

public class UsingSeatCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	UserTimeService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 좌석 사용 여부 검사
		// -> return true : 정상적인 Controller 실행
		HttpSession session = request.getSession(false);
		
		if (session != null) {
			UserVO userVO = (UserVO)session.getAttribute("userSession");
			
			List<SeatVO> seatList = service.getSeatListAll(userVO.getStore_id());
			
			for(int i=0; i < seatList.size(); i++) {
				String usingId = seatList.get(i).getUser_id();
				
				if(usingId != null) {
					if(usingId.equals(userVO.getUser_id())) {
						request.setAttribute("seatId", seatList.get(i).getSeat_id()); // 음식 주문 페이지에 좌석 아이디를 파라미터로 전송
						return true;
					}
				}
			}
		}
		response.sendRedirect(request.getContextPath() + "/user/main"); // 좌석 미 등록 시 메인페이지로 이동
		return false;
	}
}
