package com.bit.ms.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.member.model.NoticeListVO;
import com.bit.ms.member.service.MemberNoticeService;

@Controller
public class MemberNoticeController {

	@Autowired
	private MemberNoticeService service;

	// 공지사항 클릭시 공지사항을 리스트를 보여줌
	@RequestMapping("/member/notice")
	public ModelAndView getNoticeList(HttpServletRequest req) {

		String pageParam = req.getParameter("page");
		
		int pageNum = 1;
		if (pageParam != null) {
			pageNum = Integer.parseInt(pageParam);
		}

		NoticeListVO viewData = null;
		try {
			viewData = service.getNoticeList(pageNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("member/noticeBoard");

		// 공지사항 view에 결과데이터 공유(전달)
		modelAndView.addObject("viewData", viewData);

		return modelAndView;
	}
}
