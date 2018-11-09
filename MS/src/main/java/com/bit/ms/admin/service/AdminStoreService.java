package com.bit.ms.admin.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.admin.model.StoreVO;
import com.bit.ms.dao.AdminDaoInterface;

@Service
public class AdminStoreService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AdminDaoInterface adminDao;
	
	public List<StoreVO> storeListGet(){
		
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		
		return adminDao.getStoreList();
	}
	
	public int storeAdd(AdminVO adminVo) {
		
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		
		return adminDao.regAdmin(adminVo);
		
	}
	
	public void storeDelete(AdminVO adminVo) {
		
		String admin_id = adminVo.getAdmin_id();
		String store_id = Integer.toString(adminVo.getStore_id()); // int를 String으로 형변환
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("admin_id", admin_id);
		map.put("store_id", store_id);
		System.out.println(map);
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		adminDao.deleteStore(map);

	}
}
