package com.bit.ms.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.MemberDaoInterface;

@Service
public class AdminNoticeDeleteService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private MemberDaoInterface daoInterface;

	public void noticeDelete(int id) {

		daoInterface = sessionTemplate.getMapper(MemberDaoInterface.class);

		try {
			daoInterface.deleteNotice(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
