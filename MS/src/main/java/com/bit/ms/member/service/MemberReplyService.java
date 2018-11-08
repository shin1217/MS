package com.bit.ms.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.ms.dao.MemberDaoInterface;
import com.bit.ms.member.model.ReplyVO;

@Service
public class MemberReplyService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private MemberDaoInterface daoInterface;

	@Transactional
	public List<ReplyVO> listReply(int id) {
		daoInterface = sessionTemplate.getMapper(MemberDaoInterface.class);
		List<ReplyVO> reVO = null;
		try {
			reVO = daoInterface.replyList(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reVO;
	}

	@Transactional
	public void insertReply(ReplyVO vo) {
		daoInterface = sessionTemplate.getMapper(MemberDaoInterface.class);

		try {
			daoInterface.insertReply(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void deleteReply(int id) {
		daoInterface = sessionTemplate.getMapper(MemberDaoInterface.class);
		
		try {
			daoInterface.deleteReply(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateReply(ReplyVO vo) {
		daoInterface = sessionTemplate.getMapper(MemberDaoInterface.class);
		
		try {
			daoInterface.updateReply(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
