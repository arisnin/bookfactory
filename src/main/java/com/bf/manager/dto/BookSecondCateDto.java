package com.bf.manager.dto;

public class BookSecondCateDto {
	private int num;
	private String name;
	private int first_cate;

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

	public int getFirst_cate() {
		return first_cate;
	}

	public void setFirst_cate(int first_cate) {
		this.first_cate = first_cate;
	}

	@Override
	public String toString() {
		return "BookSecondCateDto [num=" + num + ", name=" + name + ", first_cate=" + first_cate + "]";
	}

}
