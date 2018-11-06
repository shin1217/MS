package com.hell.member.dao;

import java.util.List;

import com.hell.member.model.ReplyVO;

public interface ReplyDaoInterface {

	List<ReplyVO> replyList(int id) throws Exception;

	void insertReply(ReplyVO vo) throws Exception;

	void updateReply(ReplyVO vo) throws Exception;

	void deleteReply(int id) throws Exception;
}
