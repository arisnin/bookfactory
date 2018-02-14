package com.bf.myPage.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MyPageRecentLookBookDto {
	private int num;
	private String id;
	private int book_num;
	private Date look_date;
	private Date destory_date;
	
	public MyPageRecentLookBookDto(){}

	public MyPageRecentLookBookDto(int num, String id, int book_num,
			Date look_date, Date destory_date) {
		this.num = num;
		this.id = id;
		this.book_num = book_num;
		this.look_date = look_date;
		this.destory_date = destory_date;
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

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public Date getLook_date() {
		return look_date;
	}

	public void setLook_date(Date look_date) {
		this.look_date = look_date;
	}

	public Date getDestory_date() {
		return destory_date;
	}

	public void setDestory_date(Date destory_date) {
		this.destory_date = destory_date;
	}

	@Override
	public String toString() {
		return "MyPageRecentLookBookDto [num=" + num + ", id=" + id
				+ ", book_num=" + book_num + ", look_date=" + look_date
				+ ", destory_date=" + destory_date + "]";
	}
	
	
}
