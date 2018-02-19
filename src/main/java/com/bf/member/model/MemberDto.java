package com.bf.member.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @Date 2018. 2. 16.
 * @Author 박성호
 * @Description
 */
public class MemberDto implements Serializable {
	private static final long serialVersionUID = 1L;
	
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
	private String role;
	private String name;

	public MemberDto() {
	}

	public MemberDto(int num, String id, String password, String email, String gender, Date register_date, Date birthday, String marketing_check, String ip, Date last_join, String phone, String role, String name) {
		this.num = num;
		this.id = id;
		this.password = password;
		this.email = email;
		this.gender = gender;
		this.register_date = register_date;
		this.birthday = birthday;
		this.marketing_check = marketing_check;
		this.ip = ip;
		this.last_join = last_join;
		this.phone = phone;
		this.role = role;
		this.name = name;
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

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "MemberDto [num=" + num + ", id=" + id + ", password=" + password + ", email=" + email + ", gender=" + gender + ", register_date=" + register_date + ", birthday=" + birthday + ", marketing_check=" + marketing_check + ", ip=" + ip + ", last_join=" + last_join + ", phone=" + phone + ", role=" + role + ", name=" + name + "]";
	}
}
