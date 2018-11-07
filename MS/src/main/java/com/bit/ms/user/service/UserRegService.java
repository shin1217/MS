package com.bit.ms.user.service;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.member.dao.UserDaoInterface;
import com.bit.ms.member.model.UserVO;

@Service
public class UserRegService {

	@Autowired
	private SqlSessionTemplate userSqlSessin;
	private UserDaoInterface userDao;
	
	public int userReg_service(UserVO userVO) {
		
		System.out.println("서비스 콘솔 확인");
		
		int resultCnt = 0;
		
		userDao = userSqlSessin.getMapper(UserDaoInterface.class);
		try {
			resultCnt = userDao.regUser(userVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultCnt;
	}
}
