package com.bf.manager.dto;

import java.util.Date;

public class ManagerCashDto {
	private int num;
	private String id;
	private int cash_total;
	private int point_total;
	private Date last_date; //충전날짜에서 마지막충전날짜만 뽑아내야함
	private int coopon_count; 
	private String coopon; //쿠폰종류
	
	private String member_name;

	


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCash_total() {
		return cash_total;
	}

	public void setCash_total(int cash_total) {
		this.cash_total = cash_total;
	}

	public int getPoint_total() {
		return point_total;
	}

	public void setPoint_total(int point_total) {
		this.point_total = point_total;
	}

	public Date getLast_date() {
		return last_date;
	}

	public void setLast_date(Date last_date) {
		this.last_date = last_date;
	}

	public int getCoopon_count() {
		return coopon_count;
	}

	public void setCoopon_count(int coopon_count) {
		this.coopon_count = coopon_count;
	}

	public String getCoopon() {
		return coopon;
	}

	public void setCoopon(String coopon) {
		this.coopon = coopon;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	@Override
	public String toString() {
		return "ManagerCashDto [num=" + num + ", id=" + id + ", cash_total=" + cash_total + ", point_total="
				+ point_total + ", last_date=" + last_date + ", coopon_count=" + coopon_count + ", coopon=" + coopon
				+ ", member_name=" + member_name + "]";
	}
	
	
	
}
