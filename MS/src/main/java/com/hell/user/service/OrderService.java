package com.hell.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.UserDaoInterface;
import com.hell.member.model.OrderVO;

@Service
public class OrderService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	UserDaoInterface userDao;
	
	public int order(OrderVO order) {
		
		int resultCnt = 0;
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		
		resultCnt = userDao.insertOrder(order);
		
		return resultCnt;
	}
}
