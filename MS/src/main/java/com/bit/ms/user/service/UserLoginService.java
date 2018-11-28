package com.bit.ms.user.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.AdminDaoInterface;
import com.bit.ms.dao.UserDaoInterface;
import com.bit.ms.member.model.StoreVO;
import com.bit.ms.user.model.UserVO;

@Service
public class UserLoginService {

	@Autowired
	private SqlSessionTemplate userSqlSession;

	@Autowired
	private UserLoginManager loginManager;

	private UserDaoInterface userDao;
	private AdminDaoInterface adminDao;

	public int userLogin_service(UserVO userVO, int store_id, HttpSession httpSession, String user_check,
			HttpServletResponse response) {
		System.out.println("로그인 객체 확인 : " + userVO);
		String user_id = userVO.getUser_id();
		String user_pw = userVO.getUser_pw();

		userDao = userSqlSession.getMapper(UserDaoInterface.class);
		UserVO vo = userDao.loginUser(user_id);
		StoreVO storeVO = userDao.getUserStoreVO(store_id);
		
		System.out.println("로그인 객체 확인 vo : " + vo);

		// 로그인 결과값
		int result = 0;

		// store_id 저장 결과값
		int update_store_id;

		// 매장선택을 안하면 매장선택하라는 메시지발생
		if (store_id == -1) {
			result = -1;
			return result;
		}

		// 회원 정보가 없을 시
		if (vo == null) {
			result = 0;
			return result;
		}

		// 인증 안 했을 경우 인증하란 메세지 발생
		String y = "Y";
		if (!(vo.getUser_key().equals(y))) {
			result = -2;
			return result;
		}

		// 입력한 아이디와 스토어id값을 통해 정보가 존재 할 경우
		if (vo != null) {
			// 아이디,비번,스토어id가 모두 같은경우
			System.out.println("1단계");
			if (vo.getUser_id().equals(user_id) && vo.getUser_pw().equals(user_pw)) {
				System.out.println("2단계");
				// 쿠키 체크 검사
				Cookie cookie = new Cookie("user_check", user_id);
				if (user_check.equals("true")) {
					response.addCookie(cookie);
					System.out.println("3-1단계");
					// 쿠키 확인
					// System.out.println("Service check" + cookie);
				} else {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}

				System.out.println("3-2단계");
				// 세션 저장하기 전에 비밀번호 가리기
				vo.setUser_pw("");

				// 접속자 아이디를 세션에 담는다.
				httpSession.setAttribute("loginId", userVO.getUser_id());

				// 세션에 vo 객체 저장
				httpSession.setAttribute("userSession", vo);
				System.out.println("회원아이디 세션 userSession : " + httpSession.getAttribute("userSession"));

				// storeSelectSession 저장
				httpSession.setAttribute("storeSelectSession", storeVO);
				System.out.println("매장정보 세션 storeSelectSession : " + httpSession.getAttribute("storeSelectSession"));

				result = 1;

				// 중복로그인 start

				// 이미 접속한 아이디인지 체크한다.
				System.out.println("ID가 사용중인지 확인 : " + loginManager.isUsing(userVO.getUser_id()));
				loginManager.printloginUsers(); // 접속자 리스트
				if (loginManager.isUsing(userVO.getUser_id())) {
					result = -3;
				}
				loginManager.setSession(httpSession, userVO.getUser_id());

				// 중복로그인 end
			}
		}

		return result;
	}

	// 매장 리스트
	public List<StoreVO> getStoreOption() {

		adminDao = userSqlSession.getMapper(AdminDaoInterface.class);

		return adminDao.getStoreList();
	}
}
