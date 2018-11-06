package com.hell.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.UserDaoInterface;

@Service
public class UserDeleteService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private UserDaoInterface userDao;
	
	public int deleteUser(String userId) {
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		return userDao.deleteUser(userId);
	}
}
