package com.hell.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hell.admin.service.MessageDetailService;
import com.hell.admin.service.MessageGetListService;
import com.hell.member.model.MessageVo;


@Controller
public class AdminMessageController {
	
	@Autowired
	private MessageGetListService service;
	
	@Autowired
	private MessageDetailService service2;
	
	@RequestMapping("/admin/message")
	public String getMessage(Model model, HttpServletRequest request) {
		
		String messageId = request.getParameter("messageId");
		
		MessageVo message = service2.select(messageId); // 아아디값을 주면 데이터베이스에서 해당하는 쪽지정보를 가져옴
		List<MessageVo> list = service.getMessage(); // 모든 쪽지리스트를 가져옴
		
		model.addAttribute("list", list);
		model.addAttribute("detail", message);
		
		System.out.println(list);
		return "admin/adminMessage";
	}

}
