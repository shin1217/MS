package com.bit.ms.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.dao.AdminDaoInterface;

@Service
public class AdminEditService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AdminDaoInterface adminDao;
	
	public int editAdmin(AdminVO adminVo) {
	
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		return adminDao.editAdmin(adminVo);
		
	}
}
