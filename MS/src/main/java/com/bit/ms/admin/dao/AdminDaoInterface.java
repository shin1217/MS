package com.bit.ms.admin.dao;

import java.util.List;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.user.model.UserVO;

public interface AdminDaoInterface {
	
	// admin 회원가입
	public int regAdmin(AdminVO adminVO);
	
	// User List 출력
	public List<UserVO> getUserList();

}
