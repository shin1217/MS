package com.bit.ms.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.admin.model.StoreVO;
import com.bit.ms.dao.AdminDaoInterface;

@Service
public class AdminMypageService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AdminDaoInterface adminDao;
	
	//관리자 정보 가져오는 메서드
	public List<AdminVO> getAdmin(String admin_id) {
		
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		
		List<AdminVO> adminVo = adminDao.getAdminMyage(admin_id);
		
		return adminVo;
	}
	
	//해당 관리자의 매장정보를 가져오는 메서드
	public List<StoreVO> getStore(String admin_id) {
		
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		
		List<StoreVO> list = adminDao.getStore(admin_id);
		
		return list;
	}
	
	public StoreVO getStoreDetail(String store_name) {
		
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		
		return adminDao.getStoreDetail(store_name);
	}
}
