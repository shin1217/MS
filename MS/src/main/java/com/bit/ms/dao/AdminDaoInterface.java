package com.bit.ms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.admin.model.NoticeVO;
import com.bit.ms.admin.model.SalesVO;
import com.bit.ms.admin.model.UserListVO;
import com.bit.ms.member.model.ReplyVO;
import com.bit.ms.member.model.SeatVO;
import com.bit.ms.member.model.StoreVO;
import com.bit.ms.user.model.UserVO;

public interface AdminDaoInterface {

	/*관리자정보관련*/
	int regAdmin(AdminVO adminVO);// admin 회원가입
	int checkOverId(String admin_id);// admin 아이디 중복 검사
	AdminVO loginAdmin(@Param("admin_id")String admin_id);// admin 로그인
	AdminVO getAdminMyage(String admin_id);// 관리자 마이페이지
	List<StoreVO> getStore(String admin_id);	// 관리자의 해당 매장정보를 가져오는
	int editAdmin(AdminVO adminVo);	// 관리자 수정
	int deleteAdmin(String admin_id);// 관리자 삭제
	StoreVO getStoreDetail(int store_id); //매장 상세정보
	int addStore(StoreVO storeVo); //매장 추가
	void deleteStore(int store_id); //소유한 매장삭제하기
	List<StoreVO> getStoreList();// 매장 정보 가져오기
	
	/*공지사항 게시글*/
	void insertNotice(NoticeVO noticeVO) throws Exception;
	int pageCount() throws Exception;
	List<NoticeVO> selectList(int firstRow) throws Exception;
	NoticeVO selectView(int noticeId) throws Exception;
	void deleteNotice(int id) throws Exception;
	void updateNotice(NoticeVO noticeVO) throws Exception;
	
	/*공지사항 댓글*/
	List<ReplyVO> replyList(int id) throws Exception;
	void insertReply(ReplyVO vo) throws Exception;
	void updateReply(ReplyVO vo) throws Exception;
	void deleteReply(int id) throws Exception;
	
	/*회원리스트 관련*/
	List<UserVO> getUserList(int store_id);//회원리스트 전체 출력
	List<UserVO> sortingUserList(UserListVO userListVO); //클릭한 열로 정렬
	List<StoreVO> getStoreName(@Param("admin_id")String id); //관리자 아이디로 자신의 전체스토어 출력
	
	/* 매출기록 관련 */
	public List<SalesVO> listAll() throws Exception; // 매출기록 리스트 출력
	List<SalesVO> listSales(@Param("day")int day, @Param("storeId")int storeId) throws Exception;
	List<SalesVO> getStoreId(int storeId) throws Exception;
	List<SalesVO> listAlls(int nowMonth) throws Exception;
	List<SalesVO> chartList(@Param("nowMonth")int nowMonth, @Param("storeId")int storeId) throws Exception;
	
	/* 좌석관리 */
	List<SeatVO> getSeatListI(int store_id);
	int addSeatI(SeatVO seatVO);
	int deleteSeatI(int seat_id);
	int modifySeatI(SeatVO seatVO);
	
	/* 사용자 시간 관리 */
	int updateAddTime(long addTime, int seatId);
	int updateSaveTimeAll(long useTime);
	List<UserVO> getUserInfoAll();
	int deleteSeat(int seatId);
	// UserVO isUsingSeat(String userId);
	
	
}
