package com.hell.admin.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.AdminDaoInterface;
import com.hell.member.model.AdminVO;

@Service
public class AdminLoginService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private AdminDaoInterface adminDao;
	
	
	public boolean AdminLogin(String userId, String userPw, HttpSession session, String check, HttpServletResponse response) {
		
		boolean result = false;
	
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		AdminVO vo = adminDao.loginAdmin(userId);
		
		// 1. vo에는 id & pw를 받아오는데
		// 1-1. vo의 값이 null이 아니라면 얻어오는 adminId 값과 검색한 adminId값이 일치해야한다. (adminPw도 동일)
		if(vo != null && vo.getAdminId().equals(userId) && vo.getAdminPw().equals(userPw)) {
			if(check != null) {

				Cookie cookie = new Cookie("check", userId);
				response.addCookie(cookie);
				
			} else {
				
				Cookie cookie = new Cookie("check", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				
			}
			// 2. session에 adminPw 값이 노출되지 않도록 Pw값은 초기화
			vo.setAdminPw("");
			
			// 3. adminPw를 초기화하였다면 session에 저장
			session.setAttribute("adminVO", vo);
			
			System.out.println(session.getAttribute("adminVO"));//로그인 확인
	         System.out.println("그냥 객체"+vo);//로그인 확인
			
			// 모두 충족한다면 true 값으로 반환
			result = true;
		}
		
		return result;
	}
}
