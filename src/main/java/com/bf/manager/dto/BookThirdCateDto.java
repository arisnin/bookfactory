package com.bf.manager.dto;

/**
 * @이름: 염현우
 * @날짜: 2018. 3. 7.
 * @설명: 책 소분류 
 */
public class BookThirdCateDto {
	private int num;
	private String name;
	private int second_cate;

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

	public int getSecond_cate() {
		return second_cate;
	}

	public void setSecond_cate(int second_cate) {
		this.second_cate = second_cate;
	}

	@Override
	public String toString() {
		return "BookThirdCateDto [num=" + num + ", name=" + name + ", second_cate=" + second_cate + "]";
	}

}
