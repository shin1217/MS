package com.bit.ms.admin.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("storeVO")
public class StoreVO {

	private int store_id;
	private String store_name;
	private String store_address;
	private String store_num;
	private Timestamp store_regDate;
	private String admin_id;

	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_address() {
		return store_address;
	}

	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}

	public String getStore_num() {
		return store_num;
	}

	public void setStore_num(String store_num) {
		this.store_num = store_num;
	}

	public Timestamp getStore_regDate() {
		return store_regDate;
	}

	public void setStore_regDate(Timestamp store_regDate) {
		this.store_regDate = store_regDate;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	@Override
	public String toString() {
		return "StoreVO [store_id=" + store_id + ", store_name=" + store_name + ", store_address=" + store_address
				+ ", store_num=" + store_num + ", store_regDate=" + store_regDate + ", admin_id=" + admin_id + "]";
	}

}
