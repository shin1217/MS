package com.bit.ms.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.admin.model.StoreVO;
import com.bit.ms.admin.model.UserListVO;
import com.bit.ms.dao.AdminDaoInterface;
import com.bit.ms.user.model.UserVO;

@Service
public class AdminUserListService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	AdminDaoInterface adminDao;
	
	public List<UserVO> getUserList(int store_id){
		
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		
		return adminDao.getUserList(store_id);
	}

	public List<UserVO> sortingUserList(UserListVO userListVO) {
		
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		
		return adminDao.sortingUserList(userListVO);		
	}

	public List<StoreVO> getStoreName(String id) {

		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		
		return adminDao.getStoreName(id);
	}
	
}
