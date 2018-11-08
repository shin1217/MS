package com.bit.ms.user.service;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;

@Service
public class UserAddTimeService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private UserDaoInterface userDao;

	public int addTime(long addTime, String userId) {

		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);

		return userDao.addTime(addTime, userId);
	}
}
