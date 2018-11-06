package com.hell.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.UserDaoInterface;
import com.hell.member.model.UserVO;

@Service
public class UserRegService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private UserDaoInterface userDao;
	
	
	public int userReg(UserVO user) {
		
		int resultCnt = 0;
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		try {
			resultCnt = userDao.insertUser(user);
		} catch (Exception e) {
			System.out.println("익셉션 테스트");
			e.printStackTrace();
		}
		
		return resultCnt;
	}
	
	public int checkUserId(String id) {
		
		int resultCnt = 0;
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		resultCnt = userDao.checkOverId(id);
		
		return resultCnt;
	}
	
	public String checkUserPhoneNum(String phoneNum) {
		
		String result = "";
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		result = userDao.checkOverPhoneNum(phoneNum);
		
		return result;
	}
	
}
