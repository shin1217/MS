package com.bit.ms.admin.dao;

import java.util.List;

import com.bit.ms.user.model.UserVO;

public interface AdminDaoInterface {
	
	// User List 출력
	public List<UserVO> getUserList();

}
