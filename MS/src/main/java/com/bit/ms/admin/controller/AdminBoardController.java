package com.bit.ms.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.admin.model.AdminBoardVO;
import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.admin.service.AdminBoardService;
import com.bit.ms.admin.service.AdminBoardWriteServcie;

@Controller
public class AdminBoardController {

	@Autowired
	private AdminBoardService CEOBoardService;
	
	// CEO게시판 게시글 리스트
	@RequestMapping(value = "/admin/CEOBoard", method = RequestMethod.GET)
	public ModelAndView adminCEOBoard() {
		
		List<AdminBoardVO> CEOBoardList = CEOBoardService.cBoardContentList();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminCEOBoard");
		mav.addObject("CEOBoard", CEOBoardList);
		
		return mav;
	}
	
	// CEO게시판 글쓰기 버튼
	@RequestMapping(value = "/admin/CEOBoardWrite", method = RequestMethod.GET)
	public String CEOBoardWrite() {
		
		return "admin/adminCEOWriteForm";
	}
	
	
	@Autowired
	AdminBoardWriteServcie CEOWriteService;
	
	// CEO게시판 글쓰기 작성하기 완료 버튼
	@RequestMapping(method = RequestMethod.POST)
	public String CEOWriteSuccess(AdminBoardVO ceoBoardVO, HttpSession session) {
		
		// 로그인 한 세션 아이디 값을 CEOBoardVO 아이디 값에 저장시킴
		AdminVO adminVO = (AdminVO) session.getAttribute("adminSession");
		String ceoId = adminVO.getAdmin_id();
		ceoBoardVO.setWriter_id(ceoId);
		
		// 작성한 게시글이 있다면 1 / 없으면 0
		CEOWriteService.CEOBoardWrite(ceoBoardVO);
		
		return "redirect:/admin/CEOBoard";
	}
	
}
