package com.bit.ms.user.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;
import com.bit.ms.user.model.UserVO;

@Service
public class UserTimeService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private UserDaoInterface userDao;

	// 선택한 좌석의 유저 시간 업데이트(사용시간, 충전시간, 좌석 번호)
	public int updateUserAddTime(long useTime, long addTime, int seatId, String userId) {
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		return userDao.updateUserAddTime(useTime, addTime, seatId, userId);
	}
	
	// 사용 중인 모든 좌석의 유저 시간 업데이트(사용시간, 충전시간)
	public int updateUserAddTimeAll(long useTime) {
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		return userDao.updateUserAddTimeAll(useTime);
	}
	
	// 현재 좌석 사용 중인 사용자 정보 모두 가져오기
	public List<UserVO> getUserInfo(){
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		return userDao.getUserInfo();
	}
	
	// 로그인한 유저의 좌석 사용 상태 검사
	public UserVO isUsingSeat(String userId) {
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		return userDao.isUsingSeat(userId);
	}
}
