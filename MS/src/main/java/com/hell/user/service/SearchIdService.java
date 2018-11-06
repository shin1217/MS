package com.hell.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.UserDaoInterface;
import com.hell.member.model.UserVO;

@Service
public class SearchIdService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	UserDaoInterface userDao;
	
	// 유저 아이디를 찾기 위해 phoneNum를 사용
	public String userIdSearch(String phoneNum, String userName) {
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		UserVO vo = userDao.searchId(phoneNum);
		System.out.println("서비스"+vo);
		
		// 객체에 정보가 있다면 폰번호와 이름 일치시 true 값 반환
		if(vo != null) {
			if(vo.getUserPhone().equals(phoneNum) && vo.getUserName().equals(userName)) {
				
				
				return vo.getUserId();
			}
		}
		
		return "";
	}
}
