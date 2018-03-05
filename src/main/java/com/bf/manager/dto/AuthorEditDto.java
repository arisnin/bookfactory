package com.bf.manager.dto;

import java.util.Date;

public class AuthorEditDto {
	private int rnum;
	private int num;
	private int author_num;
	private String name;
	private String content;
	private String condition;
	private Date write_date;
	private String id;

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

	public int getAuthor_num() {
		return author_num;
	}

	public void setAuthor_num(int author_num) {
		this.author_num = author_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "AuthorEditDto [rnum=" + rnum + ", num=" + num + ", author_num=" + author_num + ", name=" + name
				+ ", content=" + content + ", condition=" + condition + ", write_date=" + write_date + ", id=" + id
				+ "]";
	}

}
