package com.bit.ms.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.member.dao.UserDaoInterface;
import com.bit.ms.member.model.UserVO;

@Service
public class UserEditService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private UserDaoInterface userDao;
	
	public int userEdit(UserVO userVo) {
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		return userDao.editUser(userVo);
		
	}
	
}
