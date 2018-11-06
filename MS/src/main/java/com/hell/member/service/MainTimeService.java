package com.hell.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.UserTimeDaoInterface;
import com.hell.member.model.UTimeVO;

@Service
public class MainTimeService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	UserTimeDaoInterface userTimeDaoInterface;

	public List<UTimeVO> getUTimeListService() {

		userTimeDaoInterface = sqlSessionTemplate.getMapper(UserTimeDaoInterface.class);

		return userTimeDaoInterface.getUTimeListDao();
	}

}
