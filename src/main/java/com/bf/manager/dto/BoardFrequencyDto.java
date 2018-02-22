package com.bf.manager.dto;

import java.util.Date;

/**
 * @ 작성자 : 전상헌
 * @ 작성일  : 2018. 2. 12.
 * @ 주제 및 설명 : 자주하는 질문 게시판DTO
 */
public class BoardFrequencyDto {
	private int num;
	private String title;
	private int category;
	private String content;
	private Date write_date;
	private String file_name;
	private long file_size;
	private String file_path;
	
	private String qcate1_name;
	private String qcate2_name;
	
	public BoardFrequencyDto() {}



	public BoardFrequencyDto(int num, String title, int category, String content, Date write_date, String file_name,
			long file_size, String file_path, String qcate1_name, String qcate2_name) {
		super();
		this.num = num;
		this.title = title;
		this.category = category;
		this.content = content;
		this.write_date = write_date;
		this.file_name = file_name;
		this.file_size = file_size;
		this.file_path = file_path;
		this.qcate1_name = qcate1_name;
		this.qcate2_name = qcate2_name;
	}


	public String getQcate1_name() {
		return qcate1_name;
	}



	public void setQcate1_name(String qcate1_name) {
		this.qcate1_name = qcate1_name;
	}



	public String getQcate2_name() {
		return qcate2_name;
	}



	public void setQcate2_name(String qcate2_name) {
		this.qcate2_name = qcate2_name;
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

	public long getFile_size() {
		return file_size;
	}

	public void setFile_size(long file_size) {
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
		return "BoardFrequencyDto [num=" + num + ", title=" + title + ", category=" + category + ", content=" + content
				+ ", write_date=" + write_date + ", file_name=" + file_name + ", file_size=" + file_size
				+ ", file_path=" + file_path + ", qcate1_name=" + qcate1_name + ", qcate2_name=" + qcate2_name + "]";
	}
	
	
	
	
}
