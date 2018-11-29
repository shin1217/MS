package com.bit.ms.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.admin.model.AdminBoardVO;
import com.bit.ms.dao.AdminDaoInterface;

@Service
public class AdminBoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private AdminDaoInterface adminDao;
	
	// 게시글 리스트 불러는 서비스
	public List<AdminBoardVO> cBoardContentList() {
		
		adminDao = sqlSession.getMapper(AdminDaoInterface.class);
		
		return adminDao.contentList();
	}
}
