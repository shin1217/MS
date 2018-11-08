package com.bit.ms.member.model;

import org.apache.ibatis.type.Alias;

//회원 테이블 User

@Alias("userVO")
public class UserVO {

	private String user_id; // 회원아이디
	private String user_name; // 회원이름
	private String user_pw; // 비밀번호
	private String user_phone; // 폰번호
	private String user_birth; // 생년월일
	private String user_email; // 이메일 합치기
	private String user_email1; // 이메일 앞
	private String user_email2; // 이메일 뒤
	private int store_id; // 매장번호

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_email1() {
		return user_email1;
	}

	public void setUser_email1(String user_email1) {
		this.user_email1 = user_email1;
	}

	public String getUser_email2() {
		return user_email2;
	}

	public void setUser_email2(String user_email2) {
		this.user_email2 = user_email2;
	}

	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_name=" + user_name + ", user_pw=" + user_pw + ", user_phone="
				+ user_phone + ", user_birth=" + user_birth + ", user_email=" + user_email + ", user_email1="
				+ user_email1 + ", user_email2=" + user_email2 + ", store_id=" + store_id + "]";
	}

}