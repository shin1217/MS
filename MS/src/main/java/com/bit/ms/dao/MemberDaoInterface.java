package com.bit.ms.dao;

import java.util.HashMap;
import java.util.List;

import com.bit.ms.member.model.MessageVO;

public interface MemberDaoInterface {

	//관리자 메시지, 사용자 메시지
		public List<MessageVO> getMessageList(HashMap<String,String> map); //메시지 리스트 받아오기
		public int writeMessage(MessageVO messageVo); // 메시지 쓰기
		public void deleteMessage(HashMap<String,Integer> map); //메시지 삭제하기
		public int readMessage(HashMap<String,String> map); //메시지 읽은것 확인
		public int messageCnt(HashMap<String,String> map); //안읽은 메시지 카운트
}
