package com.hell.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.UserDaoInterface;
import com.hell.member.model.UserVO;

@Service
public class SearchPwService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	UserDaoInterface userDao;
	
	public String userPwSearch(String id, String name) {
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		UserVO vo = userDao.searchPw(id);
		
		// 조건문 1. vo 객체가 null 값이 아닌 경우
		if(vo != null) {
			// 2. 1번 조건을 만족하면서 id와 name 모두 일치하는 경우
			if(vo.getUserId().equals(id) && vo.getUserName().equals(name)) {
				
				// 2-1. vo 객체에 데이터가 제대로 들어갔는지 콘솔로 확인.
				System.out.println(vo);
				// 3. vo의 객체에서 pw를 찾아준다.
				return vo.getUserPw();
			}
		}
		
		return "";
	}
}
