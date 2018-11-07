package com.bit.ms.member.service;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.admin.model.NoticeVO;
import com.bit.ms.member.dao.MemberNoticeDaoInterface;
import com.bit.ms.member.model.NoticeListVO;

@Service
public class MemberNoticeService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private MemberNoticeDaoInterface daoInterface;

	// 페이지마다 보여줄 게시글의 수
	private static final int NOTICE_COUNT_PER_PAGE = 10;

	public NoticeListVO getNoticeList(int pageNum) throws Exception {
		daoInterface = sessionTemplate.getMapper(MemberNoticeDaoInterface.class);

		int currentPageNum = pageNum;

		// 전체 게시글 구하기
		int noticeTotalCount = daoInterface.pageCount();
		List<NoticeVO> noticeList = null;
		int firstRow = 0;

		if (noticeTotalCount > 0) {
			firstRow = (pageNum - 1) * NOTICE_COUNT_PER_PAGE + 1;
			noticeList = daoInterface.selectList(firstRow - 1); // mysql은 0열부터 시작 -1을 해줌
			System.out.println("리스트확인 "+noticeList);
		} else {
			currentPageNum = 0;
			noticeList = Collections.emptyList();
		}
		return new NoticeListVO(noticeList, noticeTotalCount, currentPageNum, NOTICE_COUNT_PER_PAGE, firstRow);
	}
}
