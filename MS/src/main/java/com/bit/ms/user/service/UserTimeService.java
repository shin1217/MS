package com.bit.ms.user.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;
import com.bit.ms.member.model.SeatVO;

@Service
public class UserTimeService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private UserDaoInterface userDao;

	// 로그인한 유저의 충전 시간 업데이트(충전시간, 사용 금액, 유저 아이디, 매장 번호)
	public int updateAddTime(long addTime, int usePay, String userId, int storeId) {
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);

		// 시간추가하기 전에 DB userinfo 테이블에 매장번호 저장하기
		userDao.update_store_id_S(userId, storeId);

		return userDao.updateAddTime(addTime, usePay, userId, storeId);
	}
	
	public int updateSeat(String userId, int seatId, int storeId) {
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		
		// 좌석에 사용중인 사용자 추가
		return userDao.updateSeat(userId, seatId, storeId);
	}

	// 현재 좌석 사용 중인 사용자 정보 모두 가져오기
	public List<SeatVO> getSeatListAll(int storeId) {
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		return userDao.getSeatListAll(storeId);
	}
}
