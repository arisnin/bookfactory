package com.bf.manager.dto;

import java.util.Date;

/**
 * @ 작성자 : 전상헌
 * @ 작성일  : 2018. 3. 7.
 * @ 주제 및 설명 : 리뷰 DTO
 */
public class ReviewManagerDto {
	private int r_num;
	private String r_content;
	private int r_stat;
	private Date r_write_date;
	private int b_num;
	private String b_name;
	private String r_id;
	private int count;
	private String r_display;
	private String pcheck;
	private int pnum;
	private int prvpoint;
	
	public ReviewManagerDto() {}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public int getR_stat() {
		return r_stat;
	}

	public void setR_stat(int r_stat) {
		this.r_stat = r_stat;
	}

	public Date getR_write_date() {
		return r_write_date;
	}

	public void setR_write_date(Date r_write_date) {
		this.r_write_date = r_write_date;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getR_display() {
		return r_display;
	}

	public void setR_display(String r_display) {
		this.r_display = r_display;
	}



	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getPcheck() {
		return pcheck;
	}

	public void setPcheck(String pcheck) {
		this.pcheck = pcheck;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public int getPrvpoint() {
		return prvpoint;
	}

	public void setPrvpoint(int prvpoint) {
		this.prvpoint = prvpoint;
	}

	@Override
	public String toString() {
		return "ReviewManagerDto [r_num=" + r_num + ", r_content=" + r_content + ", r_stat=" + r_stat
				+ ", r_write_date=" + r_write_date + ", b_num=" + b_num + ", b_name=" + b_name + ", r_id=" + r_id
				+ ", count=" + count + ", r_display=" + r_display + ", pcheck=" + pcheck + ", pnum=" + pnum
				+ ", prvpoint=" + prvpoint + "]";
	}

	
	
}
