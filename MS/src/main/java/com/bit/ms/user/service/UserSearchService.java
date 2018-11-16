package com.bit.ms.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;

@Service
public class UserSearchService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private UserDaoInterface userDao;

	// 아이디 찾기
	public String get_searchId(String user_email, String user_phone) {

		userDao = sqlSession.getMapper(UserDaoInterface.class);

		System.out.println("서비스 확인" + userDao.searchId(user_email, user_phone));
		String result = "";

		try {
			result = userDao.searchId(user_email, user_phone);
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("서비스 확인 :" + userDao);
		return result;
	}

	// 비밀번호 찾기

}
