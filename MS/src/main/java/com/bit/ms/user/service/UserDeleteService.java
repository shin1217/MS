package com.bit.ms.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.member.dao.UserDaoInterface;

@Service
public class UserDeleteService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private UserDaoInterface userDao;
	
	public int deleteUser(String user_id) {
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		return userDao.deleteUser(user_id);
		
	}
	
}
