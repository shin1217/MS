package com.hell.member.model;

import org.apache.ibatis.type.Alias;

@Alias("noticeVO")
public class NoticeVO {
	private int noticeId;
	private String noticeTitle;
	private String noticeCon;
	private String noticeDate;
	
	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeCon() {
		return noticeCon;
	}

	public void setNoticeCon(String noticeCon) {
		this.noticeCon = noticeCon;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	@Override
	public String toString() {
		return "NoticeVO [noticeId=" + noticeId + ", noticeTitle=" + noticeTitle + ", noticeCon=" + noticeCon
				+ ", noticeDate=" + noticeDate + "]";
	}

}
