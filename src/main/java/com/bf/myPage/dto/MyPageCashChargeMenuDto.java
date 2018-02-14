package com.bf.myPage.dto;

import org.springframework.stereotype.Component;

@Component
public class MyPageCashChargeMenuDto {
	private int num;
	private String id;
	private int charge_cash;
	private int percentage;
	
	public MyPageCashChargeMenuDto(){}

	public MyPageCashChargeMenuDto(int num, String id, int charge_cash,
			int percentage) {
		this.num = num;
		this.id = id;
		this.charge_cash = charge_cash;
		this.percentage = percentage;
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

	public int getPercentage() {
		return percentage;
	}

	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}

	@Override
	public String toString() {
		return "MyPageCashChargeMenuDto [num=" + num + ", id=" + id
				+ ", charge_cash=" + charge_cash + ", percentage=" + percentage
				+ "]";
	}
}
