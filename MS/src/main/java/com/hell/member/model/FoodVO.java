package com.hell.member.model;

import org.apache.ibatis.type.Alias;

@Alias("foodVO")
public class FoodVO {
	private int foodId;
	private String foodName;
	private int foodStock;
	private int foodPrice;
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
	public int getFoodStock() {
		return foodStock;
	}
	public void setFoodStock(int foodStock) {
		this.foodStock = foodStock;
	}
	public int getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}
	@Override
	public String toString() {
		return "FoodVO [foodId=" + foodId + ", foodName=" + foodName + ", foodStock=" + foodStock + ", foodPrice="
				+ foodPrice + "]";
	}
}
