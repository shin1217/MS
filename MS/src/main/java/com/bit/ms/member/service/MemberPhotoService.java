package com.bit.ms.member.service;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.MemberDaoInterface;
import com.bit.ms.member.model.PhotoBoardListVO;
import com.bit.ms.member.model.PhotoBoardReplyVO;
import com.bit.ms.member.model.PhotoBoardVO;
import com.bit.ms.member.model.StoreVO;

@Service
public class MemberPhotoService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private MemberDaoInterface memberDao;
	
	private int NOTICE_COUNT_PER_PAGE = 6;//한 페이지에 보여줄 갯수
	//게시물 페이지 
	public PhotoBoardListVO getPhotoListS(int pageNumber, HttpSession session) {
		
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		
		int currentPageNum = pageNumber; // 현재 페이지 넘버
	
		StoreVO storeVo = (StoreVO) session.getAttribute("storeSelectSession");

		int store_id = storeVo.getStore_id();
		
		// 전체 게시글 구하기
		int photoTotalCount = memberDao.pageCount(store_id); //매장번호에 해당하는 게시글 가져오기
		List<PhotoBoardVO> photoList = null;
		int firstRow = 0;

		if (photoTotalCount > 0) {
			
			firstRow = (pageNumber - 1) * NOTICE_COUNT_PER_PAGE + 1;
			photoList = memberDao.selectList(store_id, firstRow - 1); // mysql은 0열부터 시작 -1을 해줌
		
		} else {
			currentPageNum = 0;
			photoList = Collections.emptyList();
		}
		
		return new PhotoBoardListVO(photoTotalCount, currentPageNum, photoList, NOTICE_COUNT_PER_PAGE, firstRow);
	}
	//게시물 등록
	public int writePhotoS(PhotoBoardVO photoVo, HttpServletRequest request) {
		
		//먼저 사진파일을 제외한 나머지 내용을 등록하고 후에 시간을 받아와서 파일을 저장
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		int resultCnt = memberDao.writePhotoI(photoVo); //사진을 제외한 나머지를 db에 저장
		//물리적 저장 경로
		String uploadUri = "/images/photoboard";
		//시스템 경로
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
		
		if(resultCnt == 1) { // 사진을 제외한 내용등록을 성공하면 
			
		//db에 저장될 파일 이름
		String imgName = photoVo.getStore_id() + "_" + photoVo.getPhoto_id();
		
			try {
				photoVo.getPhotoFile().transferTo(new File(dir, imgName));
				photoVo.setPhoto_file(imgName); //파일이름을 저장
			} catch (Exception e) { // 파일올릴때 오류가 나면 파일 지움
				System.out.println("사진등록 실패");
				new File(dir, imgName).delete();
			}
		// 사진을 db에 업데이트
		}
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("photo_file", photoVo.getPhoto_file());
		map.put("photo_id", Integer.toString(photoVo.getPhoto_id()));
		return memberDao.writePhotoComplete(map);
	}
	public PhotoBoardVO getPhotoViewS(int photo_id) {
		
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		
		return memberDao.getPhotoViewI(photo_id);
	}
	public int deletePhotoS(int photo_id) {
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		return memberDao.deletePhotoI(photo_id);
	}
	public int modifyPhotoS(PhotoBoardVO photoVo, HttpServletRequest request) {
		String uploadUri = "/images/photoboard";
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
		String imgName = photoVo.getStore_id() + "_" + photoVo.getPhoto_id();
		
		String photo_title = photoVo.getPhoto_title();
		String photo_con = photoVo.getPhoto_title();
		String photo_id = Integer.toString(photoVo.getPhoto_id());
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("photo_title", photo_title);
		map.put("photo_con", photo_con);
		map.put("photo_id", photo_id);
		try {
			photoVo.getPhotoFile().transferTo(new File(dir, imgName));
			photoVo.setPhoto_file(imgName);
			map.put("photo_file", photoVo.getPhoto_file());
		} catch (Exception e) {
			System.out.println("파일 수정 실패");
			new File(dir, imgName).delete();
		}
		return memberDao.modifyPhotoI(map);
	}
	public int writePhotoReplyS(PhotoBoardReplyVO replyVo) {
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		return memberDao.writePhotoReplyI(replyVo);
	}
	public List<PhotoBoardReplyVO> getPhotoReplyListS(int photo_id) {
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		return memberDao.getPhotoReplyListI(photo_id);
	}
	public int getCountReplyS(int photo_id) {
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		return memberDao.getCountReplyI(photo_id);
	}
	public int modiReplyS(int photoreply_id, String photoreply_con) {
		HashMap<String,String>map = new HashMap<String,String>();
		map.put("photoreply_id", Integer.toString(photoreply_id));
		map.put("photoreply_con", photoreply_con);
		
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		return memberDao.modiReplyI(map);
	}
	public int deleteReplyS(int photoreply_id) {
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		return memberDao.deleteReplyI(photoreply_id);
	}

}
