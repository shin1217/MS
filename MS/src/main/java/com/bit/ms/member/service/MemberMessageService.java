package com.bit.ms.member.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.MemberDaoInterface;
import com.bit.ms.member.model.MessageVO;

@Service
public class MemberMessageService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private MemberDaoInterface memberDao;
	//메시지리스트를 가져오는 메서드
	public List<MessageVO> getMessageList(String receive_id, String store_id){
		
		HashMap<String,String> map = new HashMap<String,String>(); //받는이와 매장아이디를 맵에 담음
		map.put("receive_id", receive_id);
		map.put("store_id", store_id);
		
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		List<MessageVO> list = memberDao.getMessageList(map); //받아온 메시지를 리스트에 담음
		
		return list;
	}
	//메시지를 쓰는 메서드
	public int messageWrite(MessageVO messageVo) {
		
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		return memberDao.writeMessage(messageVo);
		
	}
	//메시지 삭제하는 메서드
	public void messageDelete(MessageVO messageVo) {
		
		HashMap<String,Integer> map = new HashMap<String,Integer>(); //메세지 번호와 매장번호를 맵에 담음
		map.put("message_id", messageVo.getMessage_id()); 
		map.put("store_id", messageVo.getStore_id());
		
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		memberDao.deleteMessage(map);
		
	}
	//메시지 읽은것을 확인하는 메서드
	public int messageRead(MessageVO messageVo) {
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("message_read", messageVo.getMessage_read());
		map.put("message_id", Integer.toString(messageVo.getMessage_id()));
		map.put("store_id", Integer.toString(messageVo.getStore_id()));
		
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		return memberDao.readMessage(map);
	}
	//안읽은 메시지 카운트
	public int messageCnt(String receive_id, String store_id) {
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("receive_id", receive_id);
		map.put("store_id", store_id);
		
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		return memberDao.messageCnt(map);
	}
}
