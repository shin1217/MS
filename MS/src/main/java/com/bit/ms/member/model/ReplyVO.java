package com.bit.ms.member.model;

import org.apache.ibatis.type.Alias;

@Alias("replyVO")
public class ReplyVO {

	private int replyId;
	private int noId;
	private String nickName;
	private String replyCon;

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public int getNoId() {
		return noId;
	}

	public void setNoId(int noId) {
		this.noId = noId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getReplyCon() {
		return replyCon;
	}

	public void setReplyCon(String replyCon) {
		this.replyCon = replyCon;
	}

	@Override
	public String toString() {
		return "ReplyVO [replyId=" + replyId + ", noId=" + noId + ", nickName=" + nickName + ", replyCon=" + replyCon
				+ "]";
	}

}
