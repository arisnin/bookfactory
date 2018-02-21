package com.bf.myPage.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MyPagePointDto {
	private int num;
	private String id;
	private int point;
	private String point_type;
	private Date charge_date;
	private Date destory_date;
	private String state;
	private int remain;
	
	public MyPagePointDto(){}

	public MyPagePointDto(int num, String id, int point, String point_type,
			Date charge_date, Date destory_date, String state, int remain) {
		this.num = num;
		this.id = id;
		this.point = point;
		this.point_type = point_type;
		this.charge_date = charge_date;
		this.destory_date = destory_date;
		this.state = state;
		this.remain = remain;
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
		return "MyPagePointDto [num=" + num + ", id=" + id + ", point=" + point
				+ ", point_type=" + point_type + ", charge_date=" + charge_date
				+ ", destory_date=" + destory_date + ", state=" + state
				+ ", remain=" + remain + "]";
	}
}
