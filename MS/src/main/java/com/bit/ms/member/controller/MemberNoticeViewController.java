package com.bit.ms.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.ms.admin.model.NoticeVO;
import com.bit.ms.member.service.MemberNoticeViewService;

@Controller
public class MemberNoticeViewController {

	@Autowired
	private MemberNoticeViewService service;
	
	@RequestMapping("/member/notice/{noticeId}")
	public String getContent(@PathVariable("noticeId") int id, Model model) {
		
		NoticeVO vo = service.getView(id);		
		
		model.addAttribute("view", vo);
		
		return "member/noticeView";
	}
}
