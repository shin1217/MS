package com.bit.ms.member.model;

import org.apache.ibatis.type.Alias;

//회원 테이블 User

@Alias("userVO")
public class UserVO {

	private String userId; // 회원 아이디
	private String userName; // 유저이름
	private String userPw; // 비밀번호
	private String userPhone; // 폰번호
	private String userBirth; // 생년월일
	private String userEmail; // 이메일
	private int storeId; //매장번호
	
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
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getStoreId() {
		return storeId;
	}
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userName=" + userName + ", userPw=" + userPw + ", userPhone=" + userPhone
				+ ", userBirth=" + userBirth + ", userEmail=" + userEmail + ", storeId=" + storeId + "]";
	}
	

	
}
