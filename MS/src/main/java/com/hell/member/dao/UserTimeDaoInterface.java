package com.hell.member.dao;

import java.util.List;

import com.hell.member.model.UTimeVO;
import com.hell.member.model.UserVO;

public interface UserTimeDaoInterface {

	public int UTimeChargeDao(UTimeVO utime);

	public int UserChargeDao(UserVO userVO);

	public List<UTimeVO> getUTimeListDao();

	public UTimeVO getUTimeDao(int comId);
	
	public UTimeVO getUTimeDaoUserId(String userId);

	public int endTime(UserVO userVO);
	
	public int reset(int comId);

}
