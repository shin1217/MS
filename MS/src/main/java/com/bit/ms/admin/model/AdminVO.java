package com.bit.ms.admin.model;

import org.apache.ibatis.type.Alias;

@Alias("adminVO")
public class AdminVO {
	private String adminId;
	private String adminName;
	private String adminPw;

	public AdminVO() {

	}

	public AdminVO(String adminId, String adminName, String adminPw) {

		this.adminId = adminId;
		this.adminName = adminName;
		this.adminPw = adminPw;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}

	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminName=" + adminName + ", adminPw=" + adminPw + "]";
	}

}