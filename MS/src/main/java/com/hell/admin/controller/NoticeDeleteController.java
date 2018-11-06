package com.hell.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hell.admin.service.NoticeDeleteService;

@Controller
public class NoticeDeleteController {

	@Autowired
	private NoticeDeleteService service;

	// 삭제 모달창에서 삭제를 누르면 해당 글이 삭제되고 목록으로 돌아감
	@RequestMapping(value = "/admin/notice/delete/{id}", method = RequestMethod.GET)
	public String noticeDelete(@PathVariable("id") int id) {

		service.noticeDelete(id);
		
		return "redirect:/member/notice?page=1";
	}
}
