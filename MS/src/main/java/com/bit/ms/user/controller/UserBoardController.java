package com.bit.ms.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.user.model.UserBoardListVO;
import com.bit.ms.user.model.UserBoardReplyVO;
import com.bit.ms.user.model.UserBoardVO;
import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserBoardService;

@Controller
public class UserBoardController {

	@Autowired
	private UserBoardService userBoardService;

	// List
	@RequestMapping("/user/userBoard")
	public ModelAndView userBoard(HttpServletRequest request, HttpSession session) {

		String pageParam = request.getParameter("page");

		int pageNum = 1;

		if (pageParam != null) {
			pageNum = Integer.parseInt(pageParam);
		}

		UserBoardListVO ViewData = null;

		ViewData = userBoardService.getUserBoardList(session, pageNum);

		System.out.println("컨트롤러 ViewData = " + ViewData);

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("user/userBoard");

		modelAndView.addObject("userboardlist", ViewData);

		modelAndView.addObject("pageNum", pageNum);

		return modelAndView;
	}

	// Write

	@RequestMapping(value = "/user/userBoard/write", method = RequestMethod.GET)
	public String userBoardWriteForm() {

		return "user/userBoardWriteForm";
	}

	@RequestMapping(value = "/user/userBoard/write", method = RequestMethod.POST)
	public String userBoardWriteReg(UserBoardVO userBoardVO, HttpSession httpsession) {

		UserVO userVO = (UserVO) httpsession.getAttribute("userSession");

		userBoardVO.setStore_id(userVO.getStore_id());

		userBoardVO.setUser_id(userVO.getUser_id());

		System.out.println("userBoardVO 확인" + userBoardVO);

		userBoardService.userBoardWrite(userBoardVO);

		return "redirect:/user/userBoard?page=1";
	}

	// Write

	// Delete

	@RequestMapping(value = "/user/userBoard/delete/{uboard_id}", method = RequestMethod.GET)
	public String userBoardDelete(@PathVariable("uboard_id") int uboard_id) {

		userBoardService.UserBoardDeleteS(uboard_id);

		return "redirect:/user/userBoard?page=1";
	}

	// Delete

	// Modify

	@RequestMapping(value = "user/userBoard/modify/{uboard_id}", method = RequestMethod.GET)
	public ModelAndView getUserBoardModify(@PathVariable("uboard_id") int uboard_id) {

		UserBoardVO userBoardVO = userBoardService.getUserBoardViewS(uboard_id);

		ModelAndView mav = new ModelAndView();

		mav.addObject("userboardvo", userBoardVO);

		mav.setViewName("user/userBoardModifyForm");

		return mav;
	}

	@RequestMapping(value = "user/userBoard/modify/{uboard_id}", method = RequestMethod.POST)
	public String userBoardModfy(@PathVariable("uboard_id") int uboard_id, UserBoardVO userBoardVO, Model model,
			@Param("page") int page) {

		int resultCnt = 0;

		try {
			resultCnt = userBoardService.UserBoardModifyS(userBoardVO);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return "redirect:/user/userBoard/view/" + uboard_id + "?page=" + page;
	}

	// Modify

	// View

	@RequestMapping("user/userBoard/view/{uboard_id}")
	public String getUserBoardViewC(@PathVariable("uboard_id") int uboard_id, Model model) throws Exception {

		UserBoardVO userboardVO = userBoardService.getUserBoardViewS(uboard_id);

		int previousNUM = userBoardService.getViewPreviousNUM(uboard_id);

		int nextNUN = userBoardService.getViewNextNUM(uboard_id);

		if (userboardVO == null) {
			throw new Exception();
		}

		model.addAttribute("userboardvo", userboardVO);
		model.addAttribute("previousnum", previousNUM);
		model.addAttribute("nextnum", nextNUN);

		return "user/userBoardView";

	}

	// View

	// 댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글

	@RequestMapping(value = "/user/userBoard/reply/all/{uboard_id}", method = RequestMethod.GET)
	@ResponseBody
	public List<UserBoardReplyVO> UserBoardReplyList(@PathVariable("uboard_id") int uboard_id) {// 댓글 목록 불러오기

		List<UserBoardReplyVO> userboard_reply_list = userBoardService.getUserBoardReplyListS(uboard_id);

		return userboard_reply_list;

	}

	@RequestMapping(value = "/user/userBoard/reply", method = RequestMethod.POST)
	@ResponseBody
	public int UserBoardReplyWrite(UserBoardReplyVO userBoardReplyVO) {

		int resultCnt = userBoardService.UserBoardReplyInsertS(userBoardReplyVO);

		return resultCnt;
	}

	@RequestMapping(value = "/user/userBoard/reply/{uboard_reply_id}", method = RequestMethod.DELETE)
	@ResponseBody
	public int UserBoardReplyDelete(@PathVariable("uboard_reply_id") int uboard_reply_id) {

		int resultCnt = userBoardService.UserBoardReplyDeleteS(uboard_reply_id);

		return resultCnt;
	}

	@RequestMapping(value = "/user/userBoard/reply/{uboard_reply_id}", method = RequestMethod.PUT)
	@ResponseBody
	public int UserBoardReplyModify(@PathVariable("uboard_reply_id") int uboard_reply_id,
			@RequestBody UserBoardReplyVO userBoardReplyVO) {

		userBoardReplyVO.setUboard_reply_id(uboard_reply_id);

		int resultCnt = userBoardService.UserBoardReplyModifyS(userBoardReplyVO);
		System.out.println(userBoardReplyVO);
		return resultCnt;
	}
}
