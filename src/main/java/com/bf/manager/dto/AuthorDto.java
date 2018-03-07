package com.bf.manager.dto;

import java.util.Date;

/**
 * @이름: 염현우
 * @날짜: 2018. 3. 7.
 * @설명: 작가
 */
public class AuthorDto {

	private int num;
	private String name;
	private String country_num;
	private String country_name;
	private String birthday;
	private String education;
	private String career;
	private String debut;
	private String link;
	private Date update_date;
	private String awards;
	private String describe;
	
	public AuthorDto() {}

	public AuthorDto(int num, String name, String country_num, String country_name, String birthday, String education,
			String career, String debut, String link, Date update_date, String awards, String describe) {
		this.num = num;
		this.name = name;
		this.country_num = country_num;
		this.country_name = country_name;
		this.birthday = birthday;
		this.education = education;
		this.career = career;
		this.debut = debut;
		this.link = link;
		this.update_date = update_date;
		this.awards = awards;
		this.describe = describe;
	}

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

	public String getCountry_name() {
		return country_name;
	}

	public void setCountry_name(String country_name) {
		this.country_name = country_name;
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

	@Override
	public String toString() {
		return "AuthorDto [num=" + num + ", name=" + name + ", country_num=" + country_num + ", country_name="
				+ country_name + ", birthday=" + birthday + ", education=" + education + ", career=" + career
				+ ", debut=" + debut + ", link=" + link + ", update_date=" + update_date + ", awards=" + awards
				+ ", describe=" + describe + "]";
	}
	
}
