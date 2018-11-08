package com.bit.ms.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.admin.dao.AdminDaoInterface;

@Service
public class AdminDeleteService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AdminDaoInterface adminDao;
	
	public int deleteAdmin(String admin_id) {
		
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		
		return adminDao.deleteAdmin(admin_id);
	}
}
