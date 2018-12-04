package com.bit.ms.kakao;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;
import com.bit.ms.user.model.UserVO;

@Service
public class KakaoLoginCheckService {

	// 결과값 초기화
	int result = 0;
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private UserDaoInterface userDaoInterface;

	// DB에서 카카오ID를 찾는다
	public int getKakaoLogin(String id) {

		userDaoInterface = sqlSessionTemplate.getMapper(UserDaoInterface.class);

		result = userDaoInterface.getKakaoId(id);

		return result;
	}

	// DB에서 카카오ID를 통해 로그인 정보를 찾아 userVO에 넣어준다
	public UserVO kakaoLoginPass(String id, HttpSession session) {

		userDaoInterface = sqlSessionTemplate.getMapper(UserDaoInterface.class);

		UserVO vo = userDaoInterface.getKakaoToInfo(id);

		// 세션 저장하기 전에 비밀번호 가리기
		vo.setUser_pw("");

		// 접속자 아이디를 세션에 담는다.
		session.setAttribute("loginId", vo.getUser_id());

		// 세션에  vo객체를 저장
		session.setAttribute("userSession", vo);

		return vo;
	}

}
