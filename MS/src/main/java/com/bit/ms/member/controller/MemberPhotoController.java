package com.bit.ms.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.member.model.PhotoBoardListVO;
import com.bit.ms.member.model.PhotoBoardVO;
import com.bit.ms.member.service.MemberPhotoService;

@Controller
public class MemberPhotoController {

	@Autowired
	MemberPhotoService service;
	//포토게시판으로 이동
	@RequestMapping(value = "/member/photoBoard", method = RequestMethod.GET)
	public ModelAndView getPhotoList(HttpServletRequest request, HttpSession session) {
		
		String pageNumberStr = request.getParameter("page");
		int pageNumber = 1;
		
		if (pageNumberStr != null) {
			pageNumber = Integer.parseInt(pageNumberStr);
		}
		
		PhotoBoardListVO viewData = service.getPhotoListS(pageNumber, session);
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("member/photoBoard");
		modelAndView.addObject("photoData",viewData);
	
		return modelAndView;
	}
	//글쓰기로 이동
	@RequestMapping(value = "/member/photoBoard/write", method = RequestMethod.GET)
	public String writePhotoForm() {
		
		return "member/PhotoBoardWriteForm";
	}
	//글쓰기 폼에서 글 등록
	@RequestMapping(value = "/member/photoBoard/write", method = RequestMethod.POST)
	public String insertPhoto(PhotoBoardVO photoVo, HttpServletRequest request) throws IllegalStateException, IOException {
		service.writePhotoS(photoVo, request);
		return "redirect:/member/photoBoard?page=1";
	}
}
