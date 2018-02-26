package com.bf.book.dto;

/**
 * @author choi jung eun
 * @date 2018. 2. 26.
 * @description 책 상세보기에서의 카테고리 dto 
 * 카테고리 여러개 가지고 있는 책들도 있어서 따로 뺌
 */
public class DetailCateDto {
	private int first_num;
	private String first_name;
	private int second_num;
	private String second_name;
	private int third_num;
	private String third_name;
	
	public DetailCateDto() {}

	public DetailCateDto(int first_num, String first_name, int second_num, String second_name, int third_num,
			String third_name) {
		this.first_num = first_num;
		this.first_name = first_name;
		this.second_num = second_num;
		this.second_name = second_name;
		this.third_num = third_num;
		this.third_name = third_name;
	}

	public int getFirst_num() {
		return first_num;
	}

	public void setFirst_num(int first_num) {
		this.first_num = first_num;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public int getSecond_num() {
		return second_num;
	}

	public void setSecond_num(int second_num) {
		this.second_num = second_num;
	}

	public String getSecond_name() {
		return second_name;
	}

	public void setSecond_name(String second_name) {
		this.second_name = second_name;
	}

	public int getThird_num() {
		return third_num;
	}

	public void setThird_num(int third_num) {
		this.third_num = third_num;
	}

	public String getThird_name() {
		return third_name;
	}

	public void setThird_name(String third_name) {
		this.third_name = third_name;
	}

	@Override
	public String toString() {
		return "DetailCateDto [first_num=" + first_num + ", first_name=" + first_name + ", second_num=" + second_num
				+ ", second_name=" + second_name + ", third_num=" + third_num + ", third_name=" + third_name + "]";
	}
	
}
