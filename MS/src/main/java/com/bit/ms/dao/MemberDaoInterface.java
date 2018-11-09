package com.bit.ms.dao;

import java.util.List;

import com.bit.ms.admin.model.NoticeVO;
import com.bit.ms.member.model.ReplyVO;

public interface MemberDaoInterface {

	/*공지사항 게시글*/
	void insertNotice(NoticeVO noticeVO) throws Exception;
	int pageCount() throws Exception;
	List<NoticeVO> selectList(int firstRow) throws Exception;
	NoticeVO selectView(int noticeId) throws Exception;
	void deleteNotice(int id) throws Exception;
	void updateNotice(NoticeVO noticeVO) throws Exception;
	
	/*공지사항 댓글*/
	List<ReplyVO> replyList(int id) throws Exception;
	void insertReply(ReplyVO vo) throws Exception;
	void updateReply(ReplyVO vo) throws Exception;
	void deleteReply(int id) throws Exception;
}
