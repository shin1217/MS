package com.hell.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.AdminDaoInterface;
import com.hell.member.model.UserVO;

@Service
public class UserListService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	AdminDaoInterface adminDao;
	
	public List<UserVO> getUserList(){
		
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		
		return adminDao.getUserList();
	}
	
}
