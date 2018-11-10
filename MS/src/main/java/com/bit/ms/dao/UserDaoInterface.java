package com.bit.ms.dao;

import java.sql.SQLException;
import java.util.List;

import com.bit.ms.member.model.SeatVO;
import com.bit.ms.user.model.UserBoardVO;
import com.bit.ms.user.model.UserVO;

public interface UserDaoInterface {

	/* 유저정보관련 */
	public int regUser(UserVO userVO) throws SQLException;// 유저 회원가입 메서드
	public UserVO loginUser(String user_id, int store_id);// 유저 로그인 메서드
	public UserVO searchId(String userPhone);// 유저 ID 찾기
	public UserVO searchPw(String userId);// 유저 PW 찾기
	public UserVO getMyPage(String user_id);// 마이페이지 메서드
	public int editUser(UserVO userVo);// 유저 수정
	public int deleteUser(String user_id);// 유저 삭제
	public int checkOverId(String user_id);// 아이디 중복 체크
	public String checkOverPhoneNum(String userPhone);// 유저 전화번호 중복 체크

	/* 유저게시판 */
	public List<UserBoardVO> UserBoardSelectList(int firstRow);
	public int UserBoardTotalCount();
	public int insertUserBoard(UserBoardVO userBoardVO);
	public UserBoardVO getUserBoardViewI(int uboard_id);
	public int UserBoardDeleteI(int uboard_id);
	public int UserBoardModifyI(UserBoardVO userBoardVO);
	public int getPreviousNUM(int uboard_id);
	public int getNextNUM(int uboard_id);
	
	/*시간충전*/
	public long getTime(String userId);
	public int addTime(long addTime, String userId);
	public int updateSeat(long nowTime, long addTime, String userId, String seatId);
	public int updateSeatAll(long nowTime);
	public List<SeatVO> getSeatInfo();
	public SeatVO isUsingSeat(String userId);
	public int saveTime();
}
