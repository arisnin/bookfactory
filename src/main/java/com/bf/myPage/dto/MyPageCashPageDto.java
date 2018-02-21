package com.bf.myPage.dto;

import java.util.Date;

public class MyPageCashPageDto {
	private Date charge_date;
	private String cash_type;
	private int charge_cash;
	private int point;
	private String charge_type;
	
	public MyPageCashPageDto(){}

	public MyPageCashPageDto(Date charge_date, String cash_type,
			int charge_cash, int point, String charge_type) {
		this.charge_date = charge_date;
		this.cash_type = cash_type;
		this.charge_cash = charge_cash;
		this.point = point;
		this.charge_type = charge_type;
	}

	public Date getCharge_date() {
		return charge_date;
	}

	public void setCharge_date(Date charge_date) {
		this.charge_date = charge_date;
	}

	public String getCash_type() {
		return cash_type;
	}

	public void setCash_type(String cash_type) {
		this.cash_type = cash_type;
	}

	public int getCharge_cash() {
		return charge_cash;
	}

	public void setCharge_cash(int charge_cash) {
		this.charge_cash = charge_cash;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getCharge_type() {
		return charge_type;
	}

	public void setCharge_type(String charge_type) {
		this.charge_type = charge_type;
	}

	@Override
	public String toString() {
		return "MyPageCashPageDto [charge_date=" + charge_date + ", cash_type="
				+ cash_type + ", charge_cash=" + charge_cash + ", point="
				+ point + ", charge_type=" + charge_type + "]";
	}
}
