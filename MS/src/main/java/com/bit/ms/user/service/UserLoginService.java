package com.bit.ms.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.member.dao.UserDaoInterface;
import com.bit.ms.user.model.UserVO;

@Service
public class UserLoginService {

	@Autowired
	private SqlSessionTemplate userSqlSession;
	private UserDaoInterface userDao;
	
	public boolean userLogin_service(UserVO userVO) {
		
		boolean result = false;
		userDao = userSqlSession.getMapper(UserDaoInterface.class);
		
		
		
		return result;
	}
}
