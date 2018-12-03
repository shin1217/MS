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
	public AdminBoardVO cBoardContent(int cboard_id) {
		
		System.out.println("서비스단 게시글 번호" + cboard_id);
		adminDao = sqlSession.getMapper(AdminDaoInterface.class);
		
		return adminDao.contentView(cboard_id);
	}
	
	// 게시글 지우기
	public int CEOBoardDeleteService(int cboard_id) {
		
		adminDao = sqlSession.getMapper(AdminDaoInterface.class);
		
		return adminDao.contentDel(cboard_id);
	}
	
	// 게시글 수정하기
	public int modifyCEOBoardContent(AdminBoardVO ceoVO) {
		System.out.println("게시글 수정 서비스 : 진입");
		adminDao = sqlSession.getMapper(AdminDaoInterface.class);
		
		return adminDao.contentModi(ceoVO);
	}
	
}
