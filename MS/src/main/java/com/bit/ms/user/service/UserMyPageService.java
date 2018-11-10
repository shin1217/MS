package com.bit.ms.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;
import com.bit.ms.user.model.UserVO;


@Service
public class UserMyPageService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private UserDaoInterface userDao;
	   
	public UserVO getMyPage(String user_id) {
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		UserVO userData = userDao.getMyPage(user_id);
		
		return userData;
	}
	//사용자 삭제 메서드
	public int deleteUser(String user_id) {
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		
		return userDao.deleteUser(user_id);
	}
	//사용자 수정 메서드
	public int userEdit(UserVO userVo) {
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		
		return userDao.editUser(userVo);
	}
}
