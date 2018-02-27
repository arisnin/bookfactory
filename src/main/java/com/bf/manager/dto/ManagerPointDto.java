package com.bf.manager.dto;

import java.util.Date;

public class ManagerPointDto {
	private int num;
	private String point_type;
	private int point;
	private long order_num;
	private Date charge_date;
	private Date dstrory_date;

	public ManagerPointDto() {
	}

	public ManagerPointDto(int num, String point_type, int point, Date charge_date, Date dstrory_date) {
		super();
		this.num = num;
		this.point_type = point_type;
		this.point = point;
		this.charge_date = charge_date;
		this.dstrory_date = dstrory_date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getPoint_type() {
		return point_type;
	}

	public void setPoint_type(String point_type) {
		this.point_type = point_type;
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

	public Date getDstrory_date() {
		return dstrory_date;
	}

	public void setDstrory_date(Date dstrory_date) {
		this.dstrory_date = dstrory_date;
	}

	public long getOrder_num() {
		return order_num;
	}

	public void setOrder_num(long order_num) {
		this.order_num = order_num;
	}

	@Override
	public String toString() {
		return "ManagerPointDto [num=" + num + ", point_type=" + point_type + ", point=" + point + ", order_num="
				+ order_num + ", charge_date=" + charge_date + ", dstrory_date=" + dstrory_date + "]";
	}

}
