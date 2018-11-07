package com.bit.ms.member.dao;

import java.util.List;

import com.bit.ms.member.model.ReplyVO;

public interface MemberReplyDaoInterface {

	List<ReplyVO> replyList(int id) throws Exception;

	void insertReply(ReplyVO vo) throws Exception;

	void updateReply(ReplyVO vo) throws Exception;

	void deleteReply(int id) throws Exception;
}
