package com.bit.ms.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.ms.admin.model.NoticeVO;
import com.bit.ms.member.dao.MemberNoticeDaoInterface;

@Service
public class AdminNoticeWriteService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private MemberNoticeDaoInterface daoInterface;

	@Transactional
	public void noticeWrite(NoticeVO noticeVO) {

		daoInterface = sessionTemplate.getMapper(MemberNoticeDaoInterface.class);

		try {
			daoInterface.insertNotice(noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}