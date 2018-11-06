package com.hell.member.model;

import org.apache.ibatis.type.Alias;

//시간 테이블 Time (회원, 컴퓨터 N:N)
@Alias("utimeVO")
public class UTimeVO {

	private String userId; // 회원 아이디
	private int comId; // 컴퓨터 번호
	private long userTime; // 남은 시간
	private String startTime; // 시작 시간
	private String endTime; // 종료 시간

	public UTimeVO(String userId, int comId, long userTime, String startTime, String endTime) {
		super();
		this.userId = userId;
		this.comId = comId;
		this.userTime = userTime;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public UTimeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "UTime [userId=" + userId + ", comId=" + comId + ", userTime=" + userTime + ", startTime=" + startTime
				+ ", endTime=" + endTime + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getComId() {
		return comId;
	}

	public void setComId(int comId) {
		this.comId = comId;
	}

	public long getUserTime() {
		return userTime;
	}

	public void setUserTime(long userTime) {
		this.userTime = userTime;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

}
