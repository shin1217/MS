package com.bit.ms.dao;

import java.util.HashMap;
import java.util.List;

import com.bit.ms.admin.model.StoreVO;
import com.bit.ms.member.model.MessageVO;
import com.bit.ms.user.model.UserVO;

public interface MemberDaoInterface {

	//관리자 메시지, 사용자 메시지
		public List<MessageVO> getMessageList(HashMap<String,String> map); //메시지 리스트 받아오기
		public int writeMessage(MessageVO messageVo); // 메시지 쓰기
		public void deleteMessage(int message_id); //메시지 삭제하기
		public int readMessage(HashMap<String,String> map); //메시지 읽은것 확인
		public int messageCnt(HashMap<String,String> map); //안읽은 메시지 카운트
		public List<StoreVO> getStoreList(String send_id); //받는사용자의 리스트
		public List<UserVO> userListDistinct();
}
