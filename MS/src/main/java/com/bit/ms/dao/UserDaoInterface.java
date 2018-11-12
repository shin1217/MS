package com.bit.ms.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.ms.member.model.SeatVO;
import com.bit.ms.user.model.UserBoardVO;
import com.bit.ms.user.model.UserVO;

public interface UserDaoInterface {

	/* 유저정보관련 */
	int regUser(UserVO userVO) throws SQLException;// 유저 회원가입 메서드
	UserVO loginUser(@Param("user_id")String user_id, @Param("store_id")int store_id);// 유저 로그인 메서드
	UserVO searchId(String userPhone);// 유저 ID 찾기
	UserVO searchPw(String userId);// 유저 PW 찾기
	UserVO getMyPage(String user_id);// 마이페이지 메서드
	int editUser(UserVO userVo);// 유저 수정
	int deleteUser(String user_id);// 유저 삭제
	int checkOverId(String user_id);// 아이디 중복 체크
	String checkOverPhoneNum(String userPhone);// 유저 전화번호 중복 체크

	/* 유저게시판 */
	List<UserBoardVO> UserBoardSelectList(int firstRow);
	int UserBoardTotalCount();
	int insertUserBoard(UserBoardVO userBoardVO);
	UserBoardVO getUserBoardViewI(int uboard_id);
	int UserBoardDeleteI(int uboard_id);
	int UserBoardModifyI(UserBoardVO userBoardVO);
	int getPreviousNUM(int uboard_id);
	int getNextNUM(int uboard_id);
	
	/*시간충전*/
	long getTime(String userId);
	int addTime(long addTime, String userId);
	int updateSeat(long nowTime, long addTime, String userId, String seatId);
	int updateSeatAll(long nowTime);
	int updateSeatAddTime(long useTime);
	int updateUserAddTime(long useTime);
	List<SeatVO> getSeatInfo();
	SeatVO isUsingSeat(String userId);
	int saveTime();
	
}
