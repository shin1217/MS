package com.bit.ms.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;
import com.bit.ms.user.model.UserBoardVO;

@Service
public class UserBoardModifyService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private UserDaoInterface userDaoInterface;

	public int UserBoardModifyS(UserBoardVO userBoardVO) {

		userDaoInterface = sessionTemplate.getMapper(UserDaoInterface.class);

		int resultCnt = 0;

		resultCnt = userDaoInterface.UserBoardModifyI(userBoardVO);

		return resultCnt;

	}

}
