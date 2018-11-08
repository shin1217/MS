package com.bit.ms.admin.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.dao.AdminDaoInterface;

@Service
public class AdminLoginService {

	@Autowired
	private SqlSessionTemplate adminSqlSession;
	private AdminDaoInterface adminDao;
	
	public boolean adminLogin_service(String admin_id, String admin_pw, HttpSession httpSession) {
		
		boolean result = false;
		
		adminDao = adminSqlSession.getMapper(AdminDaoInterface.class);
		AdminVO vo = adminDao.loginAdmin(admin_id);
		
		// 아이디 값으로 객체 비교
		if(vo != null) {
			if(vo.getAdmin_id().equals(admin_id) && vo.getAdmin_pw().equals(admin_pw)) {
				
				// 세션 저장하기 전에 비밀번호 변경
				vo.setAdmin_pw("");
				
				// 세션에 vo 객체 저장
				httpSession.setAttribute("adminSession", vo);
				System.out.println("세션확인 " + httpSession.getAttribute("adminSession"));
				result = true;
			}
		}
		return result;
	}
}
