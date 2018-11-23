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

	// 로그인한 유저의 충전 시간 업데이트(충전시간, 좌석번호, 사용 금액, 유저 아이디, 매장 번호)
	public int updateAddTime(long addTime, int seatId, int usePay, String userId, int storeId) {
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);

		// 시간추가하기 전에 DB userinfo 테이블에 매장번호 저장하기
		int update_store_id = userDao.update_store_id_S(userId, storeId);

		return userDao.updateAddTime(addTime, seatId, usePay, userId, storeId);
	}

	// 현재 좌석 사용 중인 사용자 정보 모두 가져오기
	public List<UserVO> getUserInfoAll(int storeId) {
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		return userDao.getUserInfoAll(storeId);
	}
}
