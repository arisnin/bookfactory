package com.bf.main.dto;

import java.util.Date;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description REVIEW_REPLY 테이블에 대응되는 DTO 클래스
 */
public class ReplyDto {
	// Field
	private int num; // NUMBER(8,0)
	private String id; // VARCHAR2(40 CHAR)
	private String content; // VARCHAR2(4000 BYTE)
	private java.util.Date write_date; // DATE
	private int review_num; // NUMBER(8,0)

	// Contstructor
	public ReplyDto() {
	}

	public ReplyDto(int num, String id, String content, Date write_date, int review_num) {
		this.num = num;
		this.id = id;
		this.content = content;
		this.write_date = write_date;
		this.review_num = review_num;
	}
	
	// Get&Set
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public java.util.Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(java.util.Date write_date) {
		this.write_date = write_date;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	@Override
	public String toString() {
		return "ReplyDto [num=" + num + ", id=" + id + ", content=" + content + ", write_date=" + write_date + ", review_num=" + review_num + "]";
	}

}
