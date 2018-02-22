package com.bf.serviceCenter.dto;

import java.util.Date;



/**
 * @author : 김동환
 * @date : 2018. 2. 21.
 * comment : 고객센터 - 자주 묻는 질문 
 */


public class ServiceCenterDtoFre {
	
	private int num;
	private String title;
	private int category;
	private String content;
	private Date write_date;	
	private String file_name;
	private int file_size;	
	private String file_path;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
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
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	
	@Override
	public String toString() {
		return "ServiceCenterDto [num=" + num + ", title=" + title + ", category=" + category + ", content=" + content
				+ ", write_date=" + write_date + ", file_name=" + file_name + ", file_size=" + file_size
				+ ", file_path=" + file_path + "]";
	} 
	
	
	

}
