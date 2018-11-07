package com.bit.ms.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.member.dao.UserDaoInterface;

@Service
public class UserIdCheckService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private UserDaoInterface userDao;
	
	public int userIdCheck(String user_id) {
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		
		return userDao.checkOverId(user_id);
	}
	
}
