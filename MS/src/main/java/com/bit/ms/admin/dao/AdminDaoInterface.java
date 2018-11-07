package com.bit.ms.admin.dao;

import java.util.List;

import com.bit.ms.member.model.UserVO;

public interface AdminDaoInterface {
	
	// User List 출력
	public List<UserVO> getUserList();

}
