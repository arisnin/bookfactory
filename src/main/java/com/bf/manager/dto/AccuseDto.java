package com.bf.manager.dto;

import java.util.Date;

public class AccuseDto {
	private int rnum;
	private int review_num;
	private String review_content;
	private String description;
	private String accuse_id;
	private int accuse_num;
	private Date write_date;
	private int accuse_cate_num;
	
	
	public AccuseDto() {}

	public AccuseDto(int rnum, int review_num, String review_content, String description, String accuse_id,
			int accuse_num, Date write_date, int accuse_cate_num) {
		super();
		this.rnum = rnum;
		this.review_num = review_num;
		this.review_content = review_content;
		this.description = description;
		this.accuse_id = accuse_id;
		this.accuse_num = accuse_num;
		this.write_date = write_date;
		this.accuse_cate_num = accuse_cate_num;
	}

	public int getReview_num() {
		return review_num;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}


	public String getReview_content() {
		return review_content;
	}


	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getAccuse_id() {
		return accuse_id;
	}


	public void setAccuse_id(String accuse_id) {
		this.accuse_id = accuse_id;
	}


	public int getAccuse_num() {
		return accuse_num;
	}


	public void setAccuse_num(int accuse_num) {
		this.accuse_num = accuse_num;
	}


	public Date getWrite_date() {
		return write_date;
	}


	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}


	public int getAccuse_cate_num() {
		return accuse_cate_num;
	}


	public void setAccuse_cate_num(int accuse_cate_num) {
		this.accuse_cate_num = accuse_cate_num;
	}


	@Override
	public String toString() {
		return "AccuseDto [rnum=" + rnum + ", review_num=" + review_num + ", review_content=" + review_content
				+ ", description=" + description + ", accuse_id=" + accuse_id + ", accuse_num=" + accuse_num
				+ ", write_date=" + write_date + ", accuse_cate_num=" + accuse_cate_num + "]";
	}
	
	
	
	
}
