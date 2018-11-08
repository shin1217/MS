package com.bit.ms.user.model;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("UserBoardListVO")
public class UserBoardListVO {
	private int UserBoardTotalCount;
	private int currentPageNum;
	private List<UserBoardVO> userBoardList;
	private int pageTotalCount;
	private int userBoardCountPerPage;
	private int firstRow;

	@Override
	public String toString() {
		return "UserBoardListVO [UserBoardTotalCount=" + UserBoardTotalCount + ", currentPageNum=" + currentPageNum
				+ ", userBoardList=" + userBoardList + ", pageTotalCount=" + pageTotalCount + ", userBoardCountPerPage="
				+ userBoardCountPerPage + ", firstRow=" + firstRow + "]";
	}

	public UserBoardListVO(List<UserBoardVO> userBoardList, int userBoardTotalCount, int currentPageNum,
			int pageTotalCount, int userBoardCountPerPage, int firstRow) {
		super();
		UserBoardTotalCount = userBoardTotalCount;
		this.currentPageNum = currentPageNum;
		this.userBoardList = userBoardList;
		this.pageTotalCount = pageTotalCount;
		this.userBoardCountPerPage = userBoardCountPerPage;
		this.firstRow = firstRow;
	}

	public int getUserBoardTotalCount() {
		return UserBoardTotalCount;
	}

	public void setUserBoardTotalCount(int userBoardTotalCount) {
		UserBoardTotalCount = userBoardTotalCount;
	}

	public int getCurrentPageNum() {
		return currentPageNum;
	}

	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
	}

	public List<UserBoardVO> getUserBoardList() {
		return userBoardList;
	}

	public void setUserBoardList(List<UserBoardVO> userBoardList) {
		this.userBoardList = userBoardList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getUserBoardCountPerPage() {
		return userBoardCountPerPage;
	}

	public void setUserBoardCountPerPage(int userBoardCountPerPage) {
		this.userBoardCountPerPage = userBoardCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public UserBoardListVO() {
		super();
		// TODO Auto-generated constructor stub
	}

}