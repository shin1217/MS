package com.hell.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.UserDaoInterface;
import com.hell.member.model.UserVO;

@Service
public class UserMyPageService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	  
	private UserDaoInterface userDao;
	   
	public UserVO getMyPage(String userId) {
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		
		UserVO userData = userDao.getMyPage(userId);
		
		return userData;
	}
}
