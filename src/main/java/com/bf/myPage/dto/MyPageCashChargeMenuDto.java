package com.bf.myPage.dto;

public class MyPageCashChargeMenuDto {
	private int num;
	private int id;
	private int charge_cash;
	private int percentage;
	
	public MyPageCashChargeMenuDto(){}

	public MyPageCashChargeMenuDto(int num, int id, int charge_cash,
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
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
