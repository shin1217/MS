package com.bit.ms.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;

@Service
public class UserBoardDeleteService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private UserDaoInterface userDaoInterface;

	public int UserBoardDeleteS(int uboard_id) {

		userDaoInterface = sessionTemplate.getMapper(UserDaoInterface.class);

		int resultCnt = 0;

		try {
			resultCnt = userDaoInterface.UserBoardDeleteI(uboard_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultCnt;

	}

}
