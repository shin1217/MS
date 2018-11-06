package com.hell.member.model;

import org.apache.ibatis.type.Alias;

//회원 테이블 User

@Alias("userVO")
public class UserVO {

	private String userId; // 회원 아이디
	private String userName; // 유저이름
	private String userPw; // 비밀번호
	private String userPhone; // 폰번호
	private String userBirth; // 생년월일
	private long userTime; // 남은시간
	
	public UserVO() {
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public long getUserTime() {
		return userTime;
	}

	public void setUserTime(long userTime) {
		this.userTime = userTime;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPw=" + userPw + ", userPhone=" + userPhone
				+ ", userBirth=" + userBirth + ", userTime=" + userTime + "]";
	}

	public UserVO(String userId, String userName, String userPw, String userPhone, String userBirth, long userTime) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPw = userPw;
		this.userPhone = userPhone;
		this.userBirth = userBirth;
		this.userTime = userTime;
	}

	
}
