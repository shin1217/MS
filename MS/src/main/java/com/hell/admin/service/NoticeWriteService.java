package com.hell.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hell.member.dao.NoticeDaoInterface;
import com.hell.member.model.NoticeVO;

@Service
public class NoticeWriteService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private NoticeDaoInterface daoInterface;

	@Transactional
	public void noticeWrite(NoticeVO noticeVO) {

		daoInterface = sessionTemplate.getMapper(NoticeDaoInterface.class);

		try {
			daoInterface.insertNotice(noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}