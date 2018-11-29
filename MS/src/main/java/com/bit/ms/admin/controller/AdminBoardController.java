package com.bit.ms.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.admin.model.AdminBoardVO;
import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.admin.service.AdminCEOBoardService;

@Controller
public class AdminBoardController {

	@Autowired
	private AdminCEOBoardService CEOBoardService;
	
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
	
	// CEO게시판 글쓰기 작성하기 완료 버튼
	@RequestMapping(value = "/admin/CEOBoardWrite", method = RequestMethod.POST)
	public String CEOWriteSuccess(AdminBoardVO ceoBoardVO, HttpSession session) {
		
		// 로그인 한 세션 아이디 값을 CEOBoardVO 아이디 값에 저장시킴
		AdminVO adminVO = (AdminVO) session.getAttribute("adminSession");
		String ceoId = adminVO.getAdmin_id();
		ceoBoardVO.setWriter_id(ceoId);
		
		// 작성한 게시글이 있다면 1 / 없으면 0
		CEOBoardService.CEOBoardWrite(ceoBoardVO);
		
		return "redirect:/admin/CEOBoard";
	}
	
	// 게시글 내용 보기
	@RequestMapping(value = "/admin/CEOBoardView/view/{cboard_id}", method = RequestMethod.GET)
	public ModelAndView CEOBoardView(@PathVariable("cboard_id") int cboard_id) {
		
		System.out.println("게시글 뷰 컨트롤러 진입");
		
		// 게시글 VO 객체명 생성
		AdminBoardVO ceoBoardVO = CEOBoardService.cBoardContent(cboard_id);
		
		// 게시글VO ModelAndView 객체에 담기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminCEOViewBoard");
		mav.addObject("CEOBoard_view", ceoBoardVO);
		
		return mav;
	}
	
}
