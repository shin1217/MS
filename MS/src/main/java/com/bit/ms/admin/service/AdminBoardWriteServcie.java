package com.bit.ms.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.admin.model.AdminBoardVO;
import com.bit.ms.dao.AdminDaoInterface;

@Service
public class AdminBoardWriteServcie {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private AdminDaoInterface adminDao;
	
	public int CEOBoardWrite(AdminBoardVO ceoBoardVO) {
		
		// 초기값 0, 게시글 추가 되면 1
		int result = 0;
		
		adminDao = sqlSession.getMapper(AdminDaoInterface.class);
		result = adminDao.CEOWriteReg(ceoBoardVO);
		
		return result;
	}
}
