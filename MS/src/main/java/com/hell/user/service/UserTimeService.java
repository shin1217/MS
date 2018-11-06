package com.hell.user.service;

import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalTime;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.UserTimeDaoInterface;
import com.hell.member.model.UTimeVO;
import com.hell.member.model.UserVO;

@Service
public class UserTimeService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private UserTimeDaoInterface userTimeDaoInterface;

	public int UTimeChargeService(String userId, int comId, long remainTime) {

		System.out.println("from UserTimeService.UTimeChargeService // 서비스 시작 ");

		userTimeDaoInterface = sqlSessionTemplate.getMapper(UserTimeDaoInterface.class);

		// 시간형식
		SimpleDateFormat f;
		f = new SimpleDateFormat("HH:mm");

		Date startnow = new Date();
		String startTime = f.format(startnow); // String타입으로 변경

		LocalTime start = LocalTime.parse(startTime); // 시작시 현재시간

		System.out.println("from UserTimeService.UTimeChargeService // 현재시간 : " + startTime);

		System.out.println("from UserTimeService.UTimeChargeService // 사용 전 남은시간 : " + remainTime);

		// 사용중이던 경우
		UTimeVO beforeUTimeVO = userTimeDaoInterface.getUTimeDaoUserId(userId);
		System.out.println("from UserTimeService.UTimeChargeService // 사용전 컴퓨터 객체 확인 : " + beforeUTimeVO);

		int resultCnt = 0;

		int resetResultCnt = 0;

		if (beforeUTimeVO == null) {

		} else {

			System.out
					.println("from UserTimeService.UTimeChargeService // 충전 전 시작시간 : " + beforeUTimeVO.getStartTime());

			// 계산을 위한 String > LocalTime타입으로 변경
			LocalTime before = LocalTime.parse(beforeUTimeVO.getStartTime());

			long used = Duration.between(before, start).toMinutes();
			System.out.println("from UserTimeService.UTimeChargeService // DB확인 && if문 사용시간 used : " + used);

			remainTime = remainTime - used;
			System.out.println("from UserTimeService.UTimeChargeService // 사용 후 남은시간 : " + remainTime);

			resetResultCnt = userTimeDaoInterface.reset(beforeUTimeVO.getComId());

			if (resetResultCnt == 0) {
				System.out.println("from UserTimeService.UTimeChargeService // 기존자리 초기화 && 자리이동 실패");
			} else {
				System.out.println("from UserTimeService.UTimeChargeService // 기존자리 초기화 && 자리이동 완료");
			}

		}

		UTimeVO uTime = new UTimeVO(userId, comId, remainTime, startTime, ""); // 테스트 모델
//      UTime(String userId, String comId, long userTime, String startTime, String endTime)

		resultCnt = userTimeDaoInterface.UTimeChargeDao(uTime);

		System.out.println("from UserTimeService.UTimeChargeService // 테스트 모델 확인 : " + uTime); // 테스트 모델 확인

		System.out.println("from UserTimeService.UTimeChargeService // 새로운 자리 출력");

		System.out.println("from UserTimeService.UTimeChargeService // 서비스 끝 ");

		return resultCnt;
	}

	public int UserChargeService(String userId, int comId) {

		System.out.println("from UserTimeService.UserChargeService // 서비스 시작 ");

		userTimeDaoInterface = sqlSessionTemplate.getMapper(UserTimeDaoInterface.class);

		UTimeVO beforeUTimeVO = userTimeDaoInterface.getUTimeDao(comId);

		UserVO userVO = new UserVO();
		userVO.setUserId(userId);
		userVO.setUserTime(beforeUTimeVO.getUserTime());

		// UTime 테이블 수정 하고 받아옴(remainTime)
		System.out.println("from UserTimeService.UserChargeService // 사용 전 남은시간 : " + beforeUTimeVO.getUserTime());

		int resultCnt = 0;

		System.out.println("from UserTimeService.UserChargeService // 테스트 모델 확인 : " + userVO); // 테스트 모델 확인

		resultCnt = userTimeDaoInterface.UserChargeDao(userVO);

		System.out.println("from UserTimeService.UserChargeService// 서비스 끝 ");

		return resultCnt;
	}

	public int endTimeReg(UserVO userVO) {

		System.out.println("from TimeService.endTimeReg // 서비스 시작 ");

		userTimeDaoInterface = sqlSessionTemplate.getMapper(UserTimeDaoInterface.class);

		String userId = userVO.getUserId();

		UTimeVO uTimeVO = userTimeDaoInterface.getUTimeDaoUserId(userId);

		// 시간형식
		SimpleDateFormat f;
		f = new SimpleDateFormat("HH:mm:ss");

		// 시작
		String startTime = uTimeVO.getStartTime(); // 시작시간(객체)
		LocalTime start = LocalTime.parse(startTime); // 계산을 위한 LocalTime타입으로 변경

		// 종료
		Date endnow = new Date(); // 종료시 현재시간
		String endTime = f.format(endnow); // String타입으로 변경
		LocalTime end = LocalTime.parse(endTime); // 계산을 위한 LocalTime타입으로 변경

		// 사용시간(LocalTime, Duration, toMinutes()-type:long)
		long used = Duration.between(start, end).toMinutes();
		System.out.println("from UserTimeService.endTimeReg // 사용시간 : " + used);

		long before = uTimeVO.getUserTime();// 사용전 남은시간
		System.out.println("from UserTimeService.endTimeReg // 사용전 남은시간 : " + before);

		long after = before - used;// 사용후 남은시간
		System.out.println("from UserTimeService.endTimeReg // 사용후 남은시간 : " + after);

		userVO.setUserTime(after);// 객체에 사용후 남은시간 입력
		userVO.setUserId(userId);

		System.out.println("from UserTimeService.endTimeReg // 객체 확인 : " + userVO);

		int resultCnt = 0;

		resultCnt = userTimeDaoInterface.endTime(userVO);

		System.out.println("from TimeService.endTimeReg // 서비스 끝 ");

		return resultCnt;
	}

	public int resetReg(UserVO userVO) {

		System.out.println("from TimeService.reset // 서비스 시작 ");

		userTimeDaoInterface = sqlSessionTemplate.getMapper(UserTimeDaoInterface.class);

		String userId = userVO.getUserId();

		UTimeVO uTimeVO = userTimeDaoInterface.getUTimeDaoUserId(userId);

		int resultCnt = 0;

		resultCnt = userTimeDaoInterface.reset(uTimeVO.getComId());

		System.out.println("from TimeService.reset // 서비스 끝 ");

		return resultCnt;
	}

}