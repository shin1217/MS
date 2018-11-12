package com.bit.ms.user.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;
import com.bit.ms.user.model.UserBoardReplyVO;

@Service
public class UserBoardReplyService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private UserDaoInterface userDaoInterface;

	public List<UserBoardReplyVO> getUserBoardReplyListS(int uboard_id) {

		userDaoInterface = sessionTemplate.getMapper(UserDaoInterface.class);

		List<UserBoardReplyVO> UserBoardList = null;

		try {
			UserBoardList = userDaoInterface.getUserBoardReplyListI(uboard_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return UserBoardList;

	}

}
