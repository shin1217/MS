package com.bit.ms.dao;

import java.util.HashMap;
import java.util.List;

import com.bit.ms.member.model.MessageVO;
import com.bit.ms.member.model.StoreVO;
import com.bit.ms.user.model.UserVO;

public interface MemberDaoInterface {

		//관리자 메시지, 사용자 메시지
		List<StoreVO> adminStoreList(String admin_id); //관리자가 소유한 매장목록
		List<MessageVO> getMessageList(HashMap<String,String> map); //메시지 리스트 받아오기
		List<MessageVO> userMessageList(String receive_id); //사용자의 메시지리스트 받아오기
		int writeMessage(MessageVO messageVo); // 메시지 쓰기
		int deleteMessage(int message_id); //메시지 삭제하기
		int readMessage(HashMap<String,String> map); //메시지 읽은것 확인
		int messageCnt(HashMap<String,String> map); //안읽은 메시지 카운트(관리자)
		int userMessageCnt(String receive_id); //안읽은 메시지 카운트(사용자)
		/*List<StoreVO> getStoreList(String send_id); //받는사용자의 리스트*/		
		List<UserVO> userListDistinct(); // 쪽지를 받을 사용자 리스트 받아오기
		MessageVO getMessageDetail(int message_id);
}
