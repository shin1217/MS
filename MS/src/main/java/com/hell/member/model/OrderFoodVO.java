package com.hell.member.model;

// 모델에 담아서 뷰에 뿌려주기 위한 객체
public class OrderFoodVO {
	private int orderId;
	private int comId;
	private int foodId;
	private String foodName;
	private int totalPrice;
	private int foodCnt;
	
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	
	public int getComId() {
		return comId;
	}
	public void setComId(int comId) {
		this.comId = comId;
	}
	
	public int getFoodId() {
		return foodId;
	}
	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getFoodCnt() {
		return foodCnt;
	}
	public void setFoodCnt(int foodCnt) {
		this.foodCnt = foodCnt;
	}
	
	@Override
	public String toString() {
		return "OrderFoodVO [orderId=" + orderId + ", comId=" + comId + ", foodId=" + foodId + ", foodName=" + foodName
				+ ", totalPrice=" + totalPrice + ", foodCnt=" + foodCnt + "]";
	}
	
}
