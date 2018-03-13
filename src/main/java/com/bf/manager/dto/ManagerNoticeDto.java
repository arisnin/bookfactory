package com.bf.manager.dto;

import java.util.Date;

/**
 * @ 작성자 : 전상헌
 * @ 작성일  : 2018. 3 . 1
 * @ 주제 및 설명 : 공지사항 DTO 
 */
public class ManagerNoticeDto {
	private int num;
	private String id;
	private String title;
	private String content;
	private Date write_date;
	
	public ManagerNoticeDto() {}
	
	public ManagerNoticeDto(int num, String id, String title, String content, Date write_date) {
		super();
		this.num = num;
		this.id = id;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
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
		return "ManagerNoticeDto [num=" + num + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", write_date=" + write_date + "]";
	}
	
	
	
}
