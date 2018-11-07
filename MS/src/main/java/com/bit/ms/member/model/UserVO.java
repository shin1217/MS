package com.bit.ms.member.model;

import org.apache.ibatis.type.Alias;

//회원 테이블 User

@Alias("userVO")
public class UserVO {

	private String user_id; // 회원아이디
	private String user_name; // 회원이름
	private String user_pw; // 비밀번호
	private String user_phone; // 폰번호
	private String user_lbirth; // 생년월일
	private String user_email; // 이메일
	private int store_id; //매장번호
	
	public UserVO() {

	}

	public UserVO(String user_id, String user_name, String user_pw, String user_phone, String user_lbirth,
			String user_email, int store_id) {
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_pw = user_pw;
		this.user_phone = user_phone;
		this.user_lbirth = user_lbirth;
		this.user_email = user_email;
		this.store_id = store_id;
	}

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

	public String getUser_lbirth() {
		return user_lbirth;
	}

	public void setUser_lbirth(String user_lbirth) {
		this.user_lbirth = user_lbirth;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
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
				+ user_phone + ", user_lbirth=" + user_lbirth + ", user_email=" + user_email + ", store_id=" + store_id
				+ "]";
	}
	
}
