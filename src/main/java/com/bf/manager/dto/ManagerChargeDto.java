package com.bf.manager.dto;

import java.util.Date;

public class ManagerChargeDto {
	private int num;
	private int order_num;
	private int charge_num;
	private String charge_name;
	private String charge_point;
	private Date charge_date;
	
	public ManagerChargeDto() {}
	public ManagerChargeDto(int num, int order_num, int charge_num, String charge_name, String charge_point,
			Date charge_date) {
		super();
		this.num = num;
		this.order_num = order_num;
		this.charge_num = charge_num;
		this.charge_name = charge_name;
		this.charge_point = charge_point;
		this.charge_date = charge_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public int getCharge_num() {
		return charge_num;
	}
	public void setCharge_num(int charge_num) {
		this.charge_num = charge_num;
	}
	public String getCharge_name() {
		return charge_name;
	}
	public void setCharge_name(String charge_name) {
		this.charge_name = charge_name;
	}
	public String getCharge_point() {
		return charge_point;
	}
	public void setCharge_point(String charge_point) {
		this.charge_point = charge_point;
	}
	public Date getCharge_date() {
		return charge_date;
	}
	public void setCharge_date(Date charge_date) {
		this.charge_date = charge_date;
	}
	@Override
	public String toString() {
		return "ManagerChargeDto [num=" + num + ", order_num=" + order_num + ", charge_num=" + charge_num
				+ ", charge_name=" + charge_name + ", charge_point=" + charge_point + ", charge_date=" + charge_date
				+ "]";
	}
	
	
	
	
}
