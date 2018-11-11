package com.bit.ms.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.AdminDaoInterface;
import com.bit.ms.member.model.SeatVO;

@Service
public class AdminSeatListService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminDaoInterface adminDaoInterface;

	public List<SeatVO> getSeatListS() {

		adminDaoInterface = sqlSessionTemplate.getMapper(AdminDaoInterface.class);

		return adminDaoInterface.getSeatListI();
	}

}
