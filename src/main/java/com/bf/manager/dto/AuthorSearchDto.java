package com.bf.manager.dto;

import java.util.Date;

/**
 * @이름: 염현우
 * @날짜: 2018. 3. 7.
 * @설명: 작가검색
 */
public class AuthorSearchDto {
	private int num;
	private String name;
	private String country_num;
	private String birthday;
	private String education;
	private String career;
	private String debut;
	private String link;
	private Date update_date;
	private String awards;
	private String describe;
	private int cnt;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCountry_num() {
		return country_num;
	}

	public void setCountry_num(String country_num) {
		this.country_num = country_num;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getDebut() {
		return debut;
	}

	public void setDebut(String debut) {
		this.debut = debut;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public String getAwards() {
		return awards;
	}

	public void setAwards(String awards) {
		this.awards = awards;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "AuthorSearchDto [num=" + num + ", name=" + name + ", country_num=" + country_num + ", birthday="
				+ birthday + ", education=" + education + ", career=" + career + ", debut=" + debut + ", link=" + link
				+ ", update_date=" + update_date + ", awards=" + awards + ", describe=" + describe + ", cnt=" + cnt
				+ "]";
	}

}
