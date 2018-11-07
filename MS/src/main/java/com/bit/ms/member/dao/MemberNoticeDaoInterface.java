package com.bit.ms.member.dao;

import java.util.List;

import com.bit.ms.admin.model.NoticeVO;

public interface MemberNoticeDaoInterface {

	void insertNotice(NoticeVO noticeVO) throws Exception;

	int pageCount() throws Exception;

	List<NoticeVO> selectList(int firstRow) throws Exception;

	NoticeVO selectView(int noticeId) throws Exception;

	void deleteNotice(int id) throws Exception;

	void updateNotice(NoticeVO noticeVO) throws Exception;
}
