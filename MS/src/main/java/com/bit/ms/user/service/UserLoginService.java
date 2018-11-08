package com.bit.ms.user.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;
import com.bit.ms.user.model.UserVO;

@Service
public class UserLoginService {

	@Autowired
	private SqlSessionTemplate userSqlSession;
	private UserDaoInterface userDao;
	
	public boolean userLogin_service(String user_id, String user_pw, HttpSession httpSession) {
		
		boolean result = false;
		
		userDao = userSqlSession.getMapper(UserDaoInterface.class);
		UserVO vo = userDao.loginUser(user_id);
		
		// 아이디로 값을 찾은 경우
		if(vo !=null) {
			if(vo.getUser_id().equals(user_id) && vo.getUser_pw().equals(user_pw)) {
				
				// 세션 저장하기 전에 비밀번호 가리기
				vo.setUser_pw("");
				
				// 세션에 vo 객체 저장
				httpSession.setAttribute("userSession", vo);
				System.out.println("세션확인 " + httpSession.getAttribute("userSession"));
				result = true;
			}
		}
		return result;
	}
}
