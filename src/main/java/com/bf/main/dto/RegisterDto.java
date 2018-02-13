package com.bf.main.dto;

/**
 * 작성자 : 김도현
 * 작성일 : 2018. 2. 13.
 * 내   용 : registerDto
 */

import java.util.Date;

public class RegisterDto {
	private int num;
	private String id;
	private String password;
	private String email;
	private String gender;
	private Date register_date;
	private Date birthday;
	private String marketing_check;
	private String ip;
	private Date last_join;
	private String phone;

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getRegister_date() {
		return register_date;
	}

	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getMarketing_check() {
		return marketing_check;
	}

	public void setMarketing_check(String marketing_check) {
		this.marketing_check = marketing_check;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getLast_join() {
		return last_join;
	}

	public void setLast_join(Date last_join) {
		this.last_join = last_join;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "MainDto [num=" + num + ", id=" + id + ", password=" + password + ", email=" + email + ", gender="
				+ gender + ", register_date=" + register_date + ", birthday=" + birthday + ", marketing_check="
				+ marketing_check + ", ip=" + ip + ", last_join=" + last_join + ", phone=" + phone + "]";
	}

}