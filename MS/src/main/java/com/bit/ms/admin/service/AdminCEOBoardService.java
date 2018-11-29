package com.bit.ms.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.admin.model.AdminBoardVO;
import com.bit.ms.dao.AdminDaoInterface;

@Service
public class AdminCEOBoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private AdminDaoInterface adminDao;
	
	// 게시글 리스트 불러는 메서드
	public List<AdminBoardVO> cBoardContentList() {
		
		adminDao = sqlSession.getMapper(AdminDaoInterface.class);
		
		return adminDao.contentList();
	}
	
	// 게시글 작성 메서드
	public int CEOBoardWrite(AdminBoardVO ceoBoardVO) {
		
		// 초기값 0, 게시글 추가 되면 1
		int result = 0;
		
		adminDao = sqlSession.getMapper(AdminDaoInterface.class);
		result = adminDao.CEOWriteReg(ceoBoardVO);
		
		return result;
	}
	
	// 게시글 내용 보기 메서드
	public List<AdminBoardVO> cBoardContent() {
		
		
		
		
		return null;
	}
	
}
