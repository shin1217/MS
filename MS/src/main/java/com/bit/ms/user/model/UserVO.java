package com.bit.ms.user.model;

import org.apache.ibatis.type.Alias;

//회원 테이블 User

@Alias("userVO")
public class UserVO {

	private String user_id; // 회원아이디
	private String user_name; // 회원이름
	private String user_pw; // 비밀번호
	private String user_phone; // 폰번호
	private String user_birth; // 생년월일
	private String user_year; // 년
	private String user_month; // 월
	private String user_day; // 일
	private String user_email; // 이메일
	private long user_time; // 남은 시간
	private int store_id; // 매장번호
	private int seat_id; // 사용 중인 좌석 번호
	private int use_pay; // 결제 금액
	
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
	public String getUser_year() {
		return user_year;
	}
	public void setUser_year(String user_year) {
		this.user_year = user_year;
	}
	public String getUser_month() {
		return user_month;
	}
	public void setUser_month(String user_month) {
		this.user_month = user_month;
	}
	public String getUser_day() {
		return user_day;
	}
	public void setUser_day(String user_day) {
		this.user_day = user_day;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public long getUser_time() {
		return user_time;
	}
	public void setUser_time(long user_time) {
		this.user_time = user_time;
	}
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}
	public int getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}
	public int getUse_pay() {
		return use_pay;
	}
	public void setUse_pay(int use_pay) {
		this.use_pay = use_pay;
	}
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_name=" + user_name + ", user_pw=" + user_pw + ", user_phone="
				+ user_phone + ", user_birth=" + user_birth + ", user_year=" + user_year + ", user_month=" + user_month
				+ ", user_day=" + user_day + ", user_email=" + user_email + ", user_time=" + user_time + ", store_id="
				+ store_id + ", seat_id=" + seat_id + ", use_pay=" + use_pay + "]";
	}
}