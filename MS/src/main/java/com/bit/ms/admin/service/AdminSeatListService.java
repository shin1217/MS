package com.bit.ms.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.MemberDaoInterface;

@Service
public class AdminSeatListService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private MemberDaoInterface memberDaoInterface;
	
	
	

}
