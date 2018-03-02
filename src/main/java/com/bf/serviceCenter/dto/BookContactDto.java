package com.bf.serviceCenter.dto;

import java.util.Date;

/**
 * @author : 김동환
 * @date : 2018. 3. 2.
 * comment : 도서제안 Dto
 */

public class BookContactDto {
	private int num;
	private int category;
	private String book_name;
	private String book_writer;
	private String publisher;
	private Date write_date;
	private String id;
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_writer() {
		return book_writer;
	}
	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
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
		return "BookContactDto [num=" + num + ", category=" + category + ", book_name=" + book_name + ", book_writer="
				+ book_writer + ", publisher=" + publisher + ", write_date=" + write_date + ", id=" + id + "]";
	}
	
	
	
	
	
}


