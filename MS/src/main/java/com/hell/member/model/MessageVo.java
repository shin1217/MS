package com.hell.member.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("MessageVo")
public class MessageVo {

	private int messageId;
	private String messageTitle;
	private String messageCon;
	private String userId;
	private Timestamp messageDate;
	
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public String getMessageTitle() {
		return messageTitle;
	}
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}
	public String getMessageCon() {
		return messageCon;
	}
	public void setMessageCon(String messageCon) {
		this.messageCon = messageCon;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(Timestamp messageDate) {
		this.messageDate = messageDate;
	}
	@Override
	public String toString() {
		return "Message [messageId=" + messageId + ", messageTitle=" + messageTitle + ", messageCon=" + messageCon
				+ ", userId=" + userId + "]";
	}
	
	
	
	
}
