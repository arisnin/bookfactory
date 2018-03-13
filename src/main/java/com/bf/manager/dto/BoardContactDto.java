package com.bf.manager.dto;

import java.util.Date;

/**
 * @ 작성자 : 전상헌
 * @ 작성일  : 2018. 2. 12.
 * @ 주제 및 설명 : 1:1문의 내역 리스트Dto
 */
public class BoardContactDto {
	private int num;
	private String title;
	private String content;
	private String id;
	private Date write_date;
	private int category;
	private String reply_content;
	private String reply_check;
	private Date reply_date;
	private String file_name;
	private int file_size;
	private String file_path;
	
	private String q1_name;
	private String mem_phone;
	private String q2_name;
	
	public BoardContactDto() {}

	
	public BoardContactDto(int num, String title, String content, String id, Date write_date, int category,
			String reply_content, String reply_check, Date reply_date, String file_name, int file_size,
			String file_path, String q1_name, String mem_phone, String q2_name) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.id = id;
		this.write_date = write_date;
		this.category = category;
		this.reply_content = reply_content;
		this.reply_check = reply_check;
		this.reply_date = reply_date;
		this.file_name = file_name;
		this.file_size = file_size;
		this.file_path = file_path;
		this.q1_name = q1_name;
		this.mem_phone = mem_phone;
		this.q2_name = q2_name;
	}


	public String getQ1_name() {
		return q1_name;
	}

	public void setQ1_name(String q1_name) {
		this.q1_name = q1_name;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getQ2_name() {
		return q2_name;
	}

	public void setQ2_name(String q2_name) {
		this.q2_name = q2_name;
	}

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getReply_check() {
		return reply_check;
	}

	public void setReply_check(String reply_check) {
		this.reply_check = reply_check;
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
	
	public Date getReply_date() {
		return reply_date;
	}


	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}


	@Override
	public String toString() {
		return "BoardContactDto [num=" + num + ", title=" + title + ", content=" + content + ", id=" + id
				+ ", write_date=" + write_date + ", category=" + category + ", reply_content=" + reply_content
				+ ", reply_check=" + reply_check + ", reply_date=" + reply_date + ", file_name=" + file_name
				+ ", file_size=" + file_size + ", file_path=" + file_path + ", q1_name=" + q1_name + ", mem_phone="
				+ mem_phone + ", q2_name=" + q2_name + "]";
	}
	
	
}
