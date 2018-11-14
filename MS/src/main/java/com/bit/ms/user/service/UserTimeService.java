package com.bit.ms.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;

@Service
public class UserTimeService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private UserDaoInterface userDao;
	
	// 로그인한 유저의 충전 시간 업데이트(충전시간, 좌석번호, 유저 아이디)
	public int updatAddTime(int addTime, int seatId, String userId) {
		sqlSessionTemplate.getMapper(UserDaoInterface.class);
		return userDao.updatAddTime(addTime, seatId, userId);
	}
}
