package com.bit.ms.admin.dao;

import java.util.List;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.admin.model.StoreVO;
import com.bit.ms.user.model.UserVO;

public interface AdminDaoInterface {

	// admin 회원가입
	public int regAdmin(AdminVO adminVO);

	// admin 아이디 중복 검사
	public String checkOverId(String admin_id);

	// User List 출력
	public List<UserVO> getUserList();

	// 관리자 마이페이지(매장은 다르나 동일한관리자를 배열로 다 받아옴)
	public List<AdminVO> getAdminMyage(String admin_id);

	// 관리자의 해당 매장정보를 가져오는
	public List<StoreVO> getStore(String admin_id);

	// 관리자 수정
	public int editAdmin(AdminVO adminVo);

	// 관리자 삭제
	public int deleteAdmin(String admin_id);

}
