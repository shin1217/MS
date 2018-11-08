package com.bit.ms.member.dao;

import java.sql.SQLException;

import com.bit.ms.member.model.OrderVO;
import com.bit.ms.user.model.UserVO;

public interface UserDaoInterface {

	// 유저 회원가입 메서드	
	public int regUser(UserVO userVO) throws SQLException;
	
	// 유저 로그인 메서드
	public UserVO loginUser(String user_id);
	
	// 유저 ID 찾기
	public UserVO searchId(String userPhone);
	
	// 유저 PW 찾기
	public UserVO searchPw(String userId);
	
	// 마이페이지 메서드
	public UserVO getMyPage(String user_id);
	
	// 유저 수정
	public int editUser(UserVO userVo);

	// 유저 삭제
	public int deleteUser(String user_id);
	
	// 주문 정보
	public int insertOrder(OrderVO order);
	
	// 아이디 중복 체크
	public int checkOverId(String user_id);
	
	// 유저 전화번호 중복 체크
	public String checkOverPhoneNum(String userPhone);
}
