package com.hell.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.AdminDaoInterface;
import com.hell.member.model.AdminVO;

@Service
public class AdminRegService {

   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   private AdminDaoInterface adminDao;
   
   public int adminReg(AdminVO admin) {
      
      int resultCnt = 0;
      
      // Spring + MyBatis 연결하여 Dao에 interface 안 메서드를 넘겨준다.
      adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
      // result 값에 Dao값을 넣어준다(member를 매개변수로 설정).
      resultCnt = adminDao.insertAdmin(admin);
      
      return resultCnt;
   }
   
   public int checkAdminId(String adminid) {
	   
	   int resultCnt = 0;
	   
	   adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
	   resultCnt = adminDao.checkOverId(adminid);
	   
	   return resultCnt;
   }
}