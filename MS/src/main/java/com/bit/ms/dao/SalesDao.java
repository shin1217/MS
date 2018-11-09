package com.bit.ms.dao;

import java.util.List;

import com.bit.ms.admin.model.SalesVO;

public interface SalesDao {

	public List<SalesVO> listAll() throws Exception;
	
}
