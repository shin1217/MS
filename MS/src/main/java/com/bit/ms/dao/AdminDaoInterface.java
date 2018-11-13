package com.bit.ms.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.admin.model.NoticeVO;
import com.bit.ms.admin.model.SalesVO;
import com.bit.ms.admin.model.StoreVO;
import com.bit.ms.admin.model.UserListVO;
import com.bit.ms.member.model.ReplyVO;
import com.bit.ms.member.model.SeatVO;
import com.bit.ms.user.model.UserVO;

public interface AdminDaoInterface {

	/*관리자정보관련*/
	int regAdmin(AdminVO adminVO);// admin 회원가입
	int checkOverId(String admin_id);// admin 아이디 중복 검사
	AdminVO loginAdmin(@Param("admin_id")String admin_id, @Param("store_id")int store_id);// admin 로그인
	List<AdminVO> getAdminMyage(String admin_id);// 관리자 마이페이지(매장은 다르나 동일한관리자를 배열로 다 받아옴)
	List<StoreVO> getStore(String admin_id);	// 관리자의 해당 매장정보를 가져오는
	int editAdmin(AdminVO adminVo);	// 관리자 수정
	int deleteAdmin(String admin_id);// 관리자 삭제
	StoreVO getStoreDetail(String store_name); //매장 상세정보
	List<StoreVO> getStoreList(); //매장 불러옴
	void deleteStore(HashMap<String,String> map); //소유한 매장삭제하기
	
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
	String getStoreName(int id); //스토어id로 이름출력
	
	/* 매출기록 관련 */
	public List<SalesVO> listAll() throws Exception; // 매출기록 리스트 출력
	
	/* 좌석관리 */
	public List<SeatVO> getSeatListI();
	
	/* 사용자 시간 관리 */
	int updateAddTime(long addTime, int seatId);
	int updateSaveTimeAll(long useTime);
	List<UserVO> getUserInfoAll(); 
	// UserVO isUsingSeat(String userId);
}
