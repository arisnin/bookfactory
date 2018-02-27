package com.bf.manager.dto;

import java.util.Date;

public class ManagerChargeDto {
	private int num;
	private String id;
	private long order_num;
	private int charge_cash;
	private String charge_type;
	private int point;
	private Date charge_date;
	
	public ManagerChargeDto() {}

	public ManagerChargeDto(int num, String id, long order_num, int charge_cash, String charge_type, int point,
			Date charge_date) {
		super();
		this.num = num;
		this.id = id;
		this.order_num = order_num;
		this.charge_cash = charge_cash;
		this.charge_type = charge_type;
		this.point = point;
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

	public long getOrder_num() {
		return order_num;
	}

	public void setOrder_num(long order_num) {
		this.order_num = order_num;
	}

	public int getCharge_cash() {
		return charge_cash;
	}

	public void setCharge_cash(int charge_cash) {
		this.charge_cash = charge_cash;
	}

	public String getCharge_type() {
		return charge_type;
	}

	public void setCharge_type(String charge_type) {
		this.charge_type = charge_type;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getCharge_date() {
		return charge_date;
	}

	public void setCharge_date(Date charge_date) {
		this.charge_date = charge_date;
	}

	@Override
	public String toString() {
		return "ManagerChargeDto [num=" + num + ", id=" + id + ", order_num=" + order_num + ", charge_cash="
				+ charge_cash + ", charge_type=" + charge_type + ", point=" + point + ", charge_date=" + charge_date
				+ "]";
	}

}
