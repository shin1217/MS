package com.bit.ms.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.pc.admin.service.NoticeModifyService;
import com.bitcamp.pc.member.model.NoticeVO;
import com.bitcamp.pc.member.service.NoticeViewService;

@Controller
@RequestMapping("/admin/notice/modify/{id}")
public class NoticeModifyController {

	@Autowired
	NoticeViewService viewService;
	@Autowired
	NoticeModifyService modifyService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView noticeModify(@PathVariable("id") int id) {

		/* System.out.println(req.getHeader("referer")); */

		ModelAndView modelAndView = new ModelAndView();
		NoticeVO no = viewService.getView(id);

		modelAndView.setViewName("admin/noticeModifyForm");
		modelAndView.addObject("modifyView", no);

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String noticeModifySuccess(@PathVariable("id") int id, NoticeVO noticeVO, Model model) {

		noticeVO.setNoticeId(id); // 받은 id값을 noticeI에 넣어줌

		modifyService.noticeModify(noticeVO);

		return "redirect:/member/notice/" + id;
	}
}
