package com.bf.myPage.dto;

public class MyPageCashChargeTypeDto {
	private int num;
	private String charge_type;
	
	public MyPageCashChargeTypeDto(){}

	public MyPageCashChargeTypeDto(int num, String charge_type) {
		this.num = num;
		this.charge_type = charge_type;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getCharge_type() {
		return charge_type;
	}

	public void setCharge_type(String charge_type) {
		this.charge_type = charge_type;
	}

	@Override
	public String toString() {
		return "MyPageCashChargeTypeDto [num=" + num + ", charge_type="
				+ charge_type + "]";
	}
}
