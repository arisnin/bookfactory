package com.bf.manager.dto;

/**
 * @이름: 염현우
 * @날짜: 2018. 3. 7.
 * @설명: 책 키워드 
 */
public class KeywordDto {
	private int num;
	private String name;

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

	@Override
	public String toString() {
		return "KeywordDto [num=" + num + ", name=" + name + "]";
	}

}
