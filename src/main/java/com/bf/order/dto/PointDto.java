package com.bf.order.dto;

import java.util.Date;

public class PointDto {
	private int rnum;
	private int num;
	private String id;
	private int point;
	private String point_type;
	private Date charge_date;
	private Date destory_date;
	private String state;
	private int remain;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getPoint_type() {
		return point_type;
	}

	public void setPoint_type(String point_type) {
		this.point_type = point_type;
	}

	public Date getCharge_date() {
		return charge_date;
	}

	public void setCharge_date(Date charge_date) {
		this.charge_date = charge_date;
	}

	public Date getDestory_date() {
		return destory_date;
	}

	public void setDestory_date(Date destory_date) {
		this.destory_date = destory_date;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getRemain() {
		return remain;
	}

	public void setRemain(int remain) {
		this.remain = remain;
	}

	@Override
	public String toString() {
		return "PointDto [rnum=" + rnum + ", num=" + num + ", id=" + id + ", point=" + point + ", point_type="
				+ point_type + ", charge_date=" + charge_date + ", destory_date=" + destory_date + ", state=" + state
				+ ", remain=" + remain + "]";
	}

}
