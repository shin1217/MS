package com.bit.ms.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.admin.model.StoreVO;
import com.bit.ms.member.model.MessageVO;
import com.bit.ms.member.service.MemberMessageService;
import com.bit.ms.user.model.UserVO;

@Controller
public class MemberMessageController {

	@Autowired
	private MemberMessageService service;
	
	//사용자가 갖고있는 매장목록 가져옴
	@RequestMapping(value = "/admin/storeList", method = RequestMethod.GET)
	public @ResponseBody List<StoreVO> getAdminStoreList(HttpSession session){
		AdminVO adminVo = (AdminVO) session.getAttribute("adminSession");
		String admin_id = adminVo.getAdmin_id();
		
		return service.adminStoreListGet(admin_id);
	}
	//관리자와 매장아이디를 조건으로 메시지 리스트를 뽑음
	@RequestMapping(value = "admin/message", method = RequestMethod.POST)
	public @ResponseBody List<MessageVO> getAdminMessageList(String store_name, String receive_id){
		//System.out.println(store_name + ":" + receive_id); 
		return service.getMessageList(store_name, receive_id);
	}
	//사용자의 매장아이디를 조건으로 메시지 리스트를 뽑음
	/*@RequestMapping(value = "user/message")
	public ModelAndView getUserMessageList(HttpSession session) {
		
		//세션에서 받는사람 아이디와 매장아이디를 불러옴
		UserVO userVo = (UserVO) session.getAttribute("userSession");
		String receive_id = userVo.getUser_id(); //받는사람 아이디
		String store_id = Integer.toString(userVo.getStore_id()); //매장 아이디(string타입으로 형변환)
				
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", service.getMessageList(receive_id, store_id));
		mv.setViewName("user/userMain");
				
		return mv;
	}*/
	// 메시지 쓰기
	@RequestMapping(value = "member/writeMessage", method = RequestMethod.POST)
	public String writeMessage(MessageVO messageVo) {
		System.out.println("메시지 작성 성공 : " + messageVo);
		service.messageWrite(messageVo);
		
		return "admin/adminMain";
	}
	//메시지 삭제
	@RequestMapping(value = "member/deleteMessage/{id}")
	public String deleteMessage(@PathVariable("id") int message_id) {
	
		service.messageDelete(message_id);
		
		return "admin/adminMain";
	}
	
	//메시지를 읽었을경우
	@RequestMapping(value = "member/readMessage", method = RequestMethod.GET)
	public int readMessage(MessageVO messageVo) {
		
		return service.messageRead(messageVo);
		
	}
	//관리자 안읽은 메시지 카운트
	@RequestMapping(value = "admin/messageCnt")
	public int cntAdminMessage(HttpSession session) {
		
		AdminVO adminVo = (AdminVO) session.getAttribute("adminSession");
		String receive_id = adminVo.getAdmin_id();
		String store_id = Integer.toString(adminVo.getStore_id()); 
		
		return service.messageCnt(receive_id, store_id);
	}
	//사용자 안읽은 메시지 카운트
	@RequestMapping(value = "user/messageCnt")
	public int cntUserMessage(HttpSession session) {
			
		UserVO userVo = (UserVO) session.getAttribute("adminSession");
		String receive_id = userVo.getUser_id();
		String store_id = Integer.toString(userVo.getStore_id()); 
			
		return service.messageCnt(receive_id, store_id);
	}
	//사용자 리스트를 받아오기
	@RequestMapping(value = "member/sendList", method = RequestMethod.GET)
	public @ResponseBody List<UserVO> getReceiveList() {

		return service.getUserListDinstinct();
	}
	//받는 사람 아이디에 해당하는 매장이름 받아오기(관리자용)
	@RequestMapping(value = "member/sendStore/{id}")
	public @ResponseBody List<StoreVO> getReceiveStoreId(@PathVariable("id") String send_id){
		
		return service.getStoreName(send_id);
	}
}
