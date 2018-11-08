package com.bit.ms.member.dao;

import java.util.List;

import com.bit.ms.user.model.UserBoardVO;

public interface UserBoardDaoInterface {

	List<UserBoardVO> UserBoardSelectList(int firstRow);

	int UserBoardPageCount();

	int insertUserBoard(UserBoardVO userBoardVO);

}
