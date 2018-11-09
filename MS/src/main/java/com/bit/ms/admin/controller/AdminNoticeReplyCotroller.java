package com.bit.ms.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bit.ms.admin.service.AdminNoticeReplyService;
import com.bit.ms.member.model.ReplyVO;

@RestController
@RequestMapping("/reply")
public class AdminNoticeReplyCotroller {

	@Autowired
	AdminNoticeReplyService service;

	@RequestMapping(value = "/all/{notice_id}", method = RequestMethod.GET)
	public List<ReplyVO> replyList(@PathVariable("notice_id") int id) {

		List<ReplyVO> list = service.listReply(id);

		return list;
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public void replyInsert(ReplyVO vo) {

		service.insertReply(vo);

	}

	@RequestMapping(value = "/delete/{reply_id}", method = RequestMethod.GET)
	public void replyDelete(@PathVariable("reply_id") int id) {

		service.deleteReply(id);
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void replyModify(ReplyVO vo) {
		
		service.updateReply(vo);
	}
}
