package com.bit.ms.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.ms.admin.model.NoticeVO;
import com.bit.ms.dao.MemberDaoInterface;

@Service
public class AdminNoticeBoardService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private MemberDaoInterface memberDaoInterface;

	@Transactional
	public void noticeDelete(int id) {

		memberDaoInterface = sessionTemplate.getMapper(MemberDaoInterface.class);

		try {
			memberDaoInterface.deleteNotice(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Transactional
	public void noticeWrite(NoticeVO noticeVO) {

		memberDaoInterface = sessionTemplate.getMapper(MemberDaoInterface.class);

		try {
			memberDaoInterface.insertNotice(noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Transactional
	public void noticeModify(NoticeVO noticeVO) {
		
		memberDaoInterface = sessionTemplate.getMapper(MemberDaoInterface.class);
		
		try {
			memberDaoInterface.updateNotice(noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}