package com.bit.ms.user.model;

import org.apache.ibatis.type.Alias;

@Alias("userOrdersVO")
public class UserOrdersVO {
	private int orders_id;
	private String food_type;
	private String food_name;
	private String food_id;
	private String food_cnt;
	private int seat_id;
	private int store_id;

	public int getOrders_id() {
		return orders_id;
	}

	public void setOrders_id(int orders_id) {
		this.orders_id = orders_id;
	}

	public String getFood_type() {
		return food_type;
	}

	public void setFood_type(String food_type) {
		this.food_type = food_type;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public String getFood_id() {
		return food_id;
	}

	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}

	public String getFood_cnt() {
		return food_cnt;
	}

	public void setFood_cnt(String food_cnt) {
		this.food_cnt = food_cnt;
	}

	public int getSeat_id() {
		return seat_id;
	}

	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}

	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

	@Override
	public String toString() {
		return "UserOrdersVO [orders_id=" + orders_id + ", food_type=" + food_type + ", food_name=" + food_name
				+ ", food_id=" + food_id + ", food_cnt=" + food_cnt + ", seat_id=" + seat_id + ", store_id=" + store_id
				+ "]";
	}

}
