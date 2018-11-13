package com.bit.ms.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bit.ms.user.model.UserBoardReplyVO;
import com.bit.ms.user.service.UserBoardReplyService;

@RestController
@RequestMapping("/user/userBoard/reply")
public class UserBoardReplyController {

	@Autowired
	UserBoardReplyService userBoardReplyService;

	@RequestMapping(value = "/all/{uboard_id}", method = RequestMethod.GET)
	public List<UserBoardReplyVO> UserBoardReplyList(@PathVariable("uboard_id") int uboard_id) {// 댓글 목록 불러오기

		List<UserBoardReplyVO> userboard_reply_list = userBoardReplyService.getUserBoardReplyListS(uboard_id);

		return userboard_reply_list;

	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public int UserBoardReply(UserBoardReplyVO userBoardReplyVO) {

		int resultCnt = userBoardReplyService.UserBoardReplyInsertS(userBoardReplyVO);

		return resultCnt;
	}
}
