package com.bit.ms.user.service;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;
import com.bit.ms.user.model.UserBoardListVO;
import com.bit.ms.user.model.UserBoardVO;

@Service
public class UserBoardService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private UserDaoInterface userDaoInterface;

	// 페이지마다 보여줄 게시글의 수
	private static final int USERBOARD_COUNT_PER_PAGE = 10;

	public UserBoardListVO getUserBoardList(int pageNum) {

		userDaoInterface = sessionTemplate.getMapper(UserDaoInterface.class);

		int currentPageNum = pageNum;

		// 전체 게시글 구하기
		int userBoardTotalCount = userDaoInterface.UserBoardTotalCount();

		List<UserBoardVO> userBoardList = null;
		int firstRow = 0;

		if (userBoardTotalCount > 0) {
			firstRow = (pageNum - 1) * USERBOARD_COUNT_PER_PAGE + 1;
			userBoardList = userDaoInterface.UserBoardSelectList(firstRow - 1); // mysql은 0열부터 시작 -1을 해줌
		} else {
			currentPageNum = 0;
			userBoardList = Collections.emptyList();
		}

		int userBoardPageTotalCount = ((userBoardTotalCount - 1) / USERBOARD_COUNT_PER_PAGE) + 1;// 페이지 수

		return new UserBoardListVO(userBoardList, userBoardTotalCount, currentPageNum, userBoardPageTotalCount,
				USERBOARD_COUNT_PER_PAGE, firstRow);

	}

}
