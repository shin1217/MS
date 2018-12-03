package com.bit.ms.kakao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;

@Service
public class KakaoLoginCheckService {

	int result = 0;

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private UserDaoInterface userDaoInterface;
		
	public int getKakaoLogin(String id) {
	
		userDaoInterface = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		
		result = userDaoInterface.getKakaoId(id);
		
		return result;
	}

}
