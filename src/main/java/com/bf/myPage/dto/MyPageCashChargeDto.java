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
	private String cash_type;
	private long order_num;
	
	public MyPageCashChargeDto(){}

	public MyPageCashChargeDto(int num, String id, int charge_cash, int point_num,
			int charge_type_num, Date charge_date, String cash_type, long order_num) {
		this.num = num;
		this.id = id;
		this.charge_cash = charge_cash;
		this.point_num = point_num;
		this.charge_type_num = charge_type_num;
		this.charge_date = charge_date;
		this.cash_type = cash_type;
		this.order_num = order_num;
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

	public String getCash_type() {
		return cash_type;
	}

	public void setCash_type(String cash_type) {
		this.cash_type = cash_type;
	}

	public long getOrder_num() {
		return order_num;
	}

	public void setOrder_num(long order_num) {
		this.order_num = order_num;
	}

	@Override
	public String toString() {
		return "MyPageCashChargeDto [num=" + num + ", id=" + id
				+ ", charge_cash=" + charge_cash + ", point_num=" + point_num
				+ ", charge_type_num=" + charge_type_num + ", charge_date="
				+ charge_date + ", cash_type=" + cash_type + ", order_num="
				+ order_num + "]";
	}
}
