package com.hell.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.AdminDaoInterface;

@Service
public class AdminOrderProcessService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	AdminDaoInterface adminDao;
	
	public int orderProcess(int comId) {
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		return adminDao.deleteOrderList(comId);
	}
}
