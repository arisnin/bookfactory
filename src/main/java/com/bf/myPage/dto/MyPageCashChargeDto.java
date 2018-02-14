package com.bf.myPage.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MyPageCashChargeDto {
	private int num;
	private String id;
	private int charge_cash;
	private int point_num;
	private int charge_type_num;
	private Date charge_date;
	
	public MyPageCashChargeDto(){}

	public MyPageCashChargeDto(int num, String id, int charge_cash, int point_num,
			int charge_type_num, Date charge_date) {
		this.num = num;
		this.id = id;
		this.charge_cash = charge_cash;
		this.point_num = point_num;
		this.charge_type_num = charge_type_num;
		this.charge_date = charge_date;
	}

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

	public int getCharge_cash() {
		return charge_cash;
	}

	public void setCharge_cash(int charge_cash) {
		this.charge_cash = charge_cash;
	}

	public int getPoint_num() {
		return point_num;
	}

	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}

	public int getCharge_type_num() {
		return charge_type_num;
	}

	public void setCharge_type_num(int charge_type_num) {
		this.charge_type_num = charge_type_num;
	}

	public Date getCharge_date() {
		return charge_date;
	}

	public void setCharge_date(Date charge_date) {
		this.charge_date = charge_date;
	}

	@Override
	public String toString() {
		return "MyPagePointDto [num=" + num + ", id=" + id + ", charge_cash="
				+ charge_cash + ", point_num=" + point_num
				+ ", charge_type_num=" + charge_type_num + ", charge_date="
				+ charge_date + "]";
	}
}
