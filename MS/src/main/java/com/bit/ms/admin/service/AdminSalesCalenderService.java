package com.bit.ms.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.admin.model.SalesVO;
import com.bit.ms.dao.AdminDaoInterface;

@Service
public class AdminSalesCalenderService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private AdminDaoInterface salesDao;
	
	public List<SalesVO> salesList() {
		
		salesDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		List<SalesVO> list = null;
		
		try {
			list = salesDao.listAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
		
	};
	
}
