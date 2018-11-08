package com.bit.ms.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.ms.member.dao.UserBoardDaoInterface;
import com.bit.ms.user.model.UserBoardVO;

@Service
public class UserBoardWriteService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private UserBoardDaoInterface userBoardDaoInterface;

	@Transactional
	public int userBoardWrite(UserBoardVO userBoardVO) {

		userBoardDaoInterface = sessionTemplate.getMapper(UserBoardDaoInterface.class);

		int resultCnt = 0;

		try {
			resultCnt = userBoardDaoInterface.insertUserBoard(userBoardVO);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultCnt;
	}

}