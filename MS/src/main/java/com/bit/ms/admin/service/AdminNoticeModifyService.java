package com.bit.ms.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.ms.admin.model.NoticeVO;
import com.bit.ms.member.dao.MemberNoticeDaoInterface;

@Service
public class AdminNoticeModifyService {

	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	MemberNoticeDaoInterface daoInterface;
	
	@Transactional
	public void noticeModify(NoticeVO noticeVO) {
		
		daoInterface = sessionTemplate.getMapper(MemberNoticeDaoInterface.class);
		
		try {
			daoInterface.updateNotice(noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
