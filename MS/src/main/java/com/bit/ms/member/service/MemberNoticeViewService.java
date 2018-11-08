package com.bit.ms.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.ms.admin.model.NoticeVO;
import com.bit.ms.dao.MemberDaoInterface;

@Service
public class MemberNoticeViewService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private MemberDaoInterface daoInterface;

	@Transactional
	public NoticeVO getView(int id) {

		daoInterface = sessionTemplate.getMapper(MemberDaoInterface.class);

		NoticeVO no = null;
		try {
			no = daoInterface.selectView(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return no;
	}

}
