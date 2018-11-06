package com.hell.member.model;

import org.apache.ibatis.type.Alias;

@Alias("orderVO")
public class OrderVO {
	private int orderId;
	private int comId;
	private int orderFoodId;
	private int orderCnt;
	
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
	public int getOrderFoodId() {
		return orderFoodId;
	}
	public void setOrderFoodId(int orderFoodId) {
		this.orderFoodId = orderFoodId;
	}
	public int getOrderCnt() {
		return orderCnt;
	}
	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}
	
	@Override
	public String toString() {
		return "OrderVO [orderId=" + orderId + ", comId=" + comId + ", orderFoodId=" + orderFoodId + ", orderCnt="
				+ orderCnt + "]";
	}
	
	
}
