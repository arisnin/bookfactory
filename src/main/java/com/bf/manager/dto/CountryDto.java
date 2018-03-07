package com.bf.manager.dto;

/**
 * @이름: 염현우
 * @날짜: 2018. 3. 7.
 * @설명: 나라 관련 데이터 
 */
public class CountryDto {
	private String country_num;
	private String country_name;
	private String country_en;

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

	public String getCountry_en() {
		return country_en;
	}

	public void setCountry_en(String country_en) {
		this.country_en = country_en;
	}

	@Override
	public String toString() {
		return "CountryDto [country_num=" + country_num + ", country_name=" + country_name + ", country_en="
				+ country_en + "]";
	}

}
