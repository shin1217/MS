package com.bit.ms.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.ms.member.model.StoreVO;
import com.bit.ms.user.model.UserBoardReplyVO;
import com.bit.ms.user.model.UserBoardVO;
import com.bit.ms.user.model.UserVO;

public interface UserDaoInterface {

	/* 유저정보관련 */
	int regUser(UserVO userVO) throws SQLException;// 유저 회원가입 메서드
	UserVO loginUser(@Param("user_id")String user_id, @Param("store_id")int store_id);// 유저 로그인 메서드
	String searchId(@Param("user_name")String user_name, @Param("user_phone")String user_phone);// 유저 ID 찾기
	UserVO searchPw(String userId);// 유저 PW 찾기
	List<UserVO> getMyPage(String user_id);// 마이페이지 메서드
	int editUser(UserVO userVo);// 유저 수정
	int deleteUser(String user_id);// 유저 삭제
	int checkOverId(String user_id);// 아이디 중복 체크
	String checkOverPhoneNum(String userPhone);// 유저 전화번호 중복 체크
	StoreVO getUserStoreVO(int store_id); // 유저로그인한 스토어id로 스토어VO가져옴
	
	/* 유저게시판 */
	List<UserBoardVO> UserBoardSelectList(@Param("store_id") int store_id, @Param("firstRow") int firstRow);
	int UserBoardTotalCount(int store_id);
	int insertUserBoard(UserBoardVO userBoardVO);
	UserBoardVO getUserBoardViewI(int uboard_id);
	int UserBoardDeleteI(int uboard_id);
	int UserBoardModifyI(UserBoardVO userBoardVO);
	int getPreviousNUM(@Param("uboard_id") int uboard_id, @Param("store_id") int store_id);
	int getNextNUM(@Param("uboard_id") int uboard_id, @Param("store_id") int store_id);
	
	/* 유저게시판 댓글 */
	List<UserBoardReplyVO> getUserBoardReplyListI(int uboard_id);
	int UserBoardReplyInsertI(UserBoardReplyVO userBoardReplyVO);
	int UserBoardReplyDeleteI(int uboard_reply_id);
	int UserBoardReplyModifyI(UserBoardReplyVO userBoardReplyVO);
	
	/*시간 충전*/
	int updateAddTime(long addTime, int seatId, int usePay, String userId, int storeId);
	List<UserVO> getUserInfoAll(int storeId);
}
