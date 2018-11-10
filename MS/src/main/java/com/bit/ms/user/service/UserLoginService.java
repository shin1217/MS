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
	
	public int userLogin_service(String user_id, String user_pw, int store_id, HttpSession httpSession) {
		
		int result = 0;
		
		userDao = userSqlSession.getMapper(UserDaoInterface.class);
		UserVO vo = userDao.loginUser(user_id, store_id);
		
		// 아이디로 값을 찾은 경우
		if(vo !=null) {
			// 아이디,비번,스토어id가 모두 같은경우
			if(vo.getUser_id().equals(user_id) && vo.getUser_pw().equals(user_pw) && vo.getStore_id() == store_id) {
				
				// 세션 저장하기 전에 비밀번호 가리기
				vo.setUser_pw("");
				
				// 세션에 vo 객체 저장
				httpSession.setAttribute("userSession", vo);
				System.out.println("세션확인 " + httpSession.getAttribute("userSession"));
				result = 1;
			}
		}
		return result;
	}
}
