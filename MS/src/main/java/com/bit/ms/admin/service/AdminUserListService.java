package com.bit.ms.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.AdminDaoInterface;
import com.bit.ms.user.model.UserVO;

@Service
public class AdminUserListService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	AdminDaoInterface adminDao;
	
	public List<UserVO> getUserList(){
		
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		
		return adminDao.getUserList();
	}

	public List<UserVO> sortingUserList(String sortName, String orderBy) {
		
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		
		return adminDao.sortingUserList(sortName, orderBy);		
	}
	
}
