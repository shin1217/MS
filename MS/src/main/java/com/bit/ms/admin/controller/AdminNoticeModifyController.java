package com.bit.ms.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.admin.model.NoticeVO;
import com.bit.ms.admin.service.AdminNoticeModifyService;
import com.bit.ms.member.service.MemberNoticeViewService;

@Controller
@RequestMapping("/admin/notice/modify/{id}")
public class AdminNoticeModifyController {

	@Autowired
	MemberNoticeViewService viewService;
	@Autowired
	AdminNoticeModifyService modifyService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView noticeModify(@PathVariable("id") int id) {

		ModelAndView modelAndView = new ModelAndView();
		NoticeVO no = viewService.getView(id);

		modelAndView.setViewName("/admin/adminNoticeModifyForm");
		modelAndView.addObject("modifyView", no);

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String noticeModifySuccess(@PathVariable("id") int id, NoticeVO noticeVO, Model model) {

		noticeVO.setNotice_id(id); // 받은 id값을 notice_id에 넣어줌

		modifyService.noticeModify(noticeVO);

		return "redirect:/member/notice/" + id;
	}
}
