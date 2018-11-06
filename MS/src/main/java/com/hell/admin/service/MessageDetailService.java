package com.hell.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.MessageDaoInterface;
import com.hell.member.model.MessageVo;


@Service
public class MessageDetailService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MessageDaoInterface messageDao;
	
	public MessageVo select(String messageId) {
		
		messageDao = sqlSessionTemplate.getMapper(MessageDaoInterface.class);
		return messageDao.selectOne(messageId);
		
	}
	
}
