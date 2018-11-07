package com.bit.ms.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.ms.admin.model.NoticeVO;
import com.bit.ms.admin.service.AdminNoticeWriteService;

@Controller
@RequestMapping("/admin/noticeWrite")
public class AdminNoticeWriteController {

	@Autowired
	private AdminNoticeWriteService service;
	
	// 공지사항에서 글쓰기 클릭시 글쓰기폼으로 이동
	@RequestMapping(method = RequestMethod.GET)
	public String getWriteForm() {

		return "admin/adminNoticeWriteForm";
	}

	// 글작성 완료시 다시 공지사항 게시판으로 이동
	@RequestMapping(method = RequestMethod.POST)
	public String writeSuccess(NoticeVO noticeVO) {

		service.noticeWrite(noticeVO);
		
		return "redirect:/member/notice?page=1";
	}
}
