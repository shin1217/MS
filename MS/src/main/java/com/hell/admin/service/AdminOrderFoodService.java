package com.hell.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.AdminDaoInterface;
import com.hell.member.model.FoodVO;

@Service
public class AdminOrderFoodService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	AdminDaoInterface adminDao;
	
	public FoodVO getOderFoodList(int orderFoodId) {
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		
		return adminDao.getOrderFoodList(orderFoodId);
	}
}
