package com.bf.manager.dto;

import java.util.Date;

/**
 * @이름: 염현우
 * @날짜: 2018. 2. 13.
 * @설명: 출판사 DTO
 */
public class PublisherDto {
	private int pub_num;
	private String name;
	private String url;
	private Date join_date;

	public int getPub_num() {
		return pub_num;
	}

	public void setPub_num(int pub_num) {
		this.pub_num = pub_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	@Override
	public String toString() {
		return "PublisherDto [pub_num=" + pub_num + ", name=" + name + ", url=" + url + ", join_date=" + join_date
				+ "]";
	}

}
