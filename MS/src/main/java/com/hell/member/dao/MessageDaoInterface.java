package com.hell.member.dao;

import java.util.List;

import com.hell.member.model.MessageVo;

public interface MessageDaoInterface {
	public int insertMessage(MessageVo messageVo); 
	
	public List<MessageVo> selectList();
	
	public MessageVo selectOne(String messageId);
	
	public int deleteMessage(String messageId);
}
