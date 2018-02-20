package com.bf.main.dto;

import java.util.Date;

public class NoticeDto {
	
	private int num;
	private String id;
	private String title;
	private String content;
	private Date write_date;
	
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	
	@Override
	public String toString() {
		return "NoticeDto [num=" + num + ", id=" + id + ", title=" + title + ", content=" + content + ", write_date="
				+ write_date + "]";
	}
	
	
}
