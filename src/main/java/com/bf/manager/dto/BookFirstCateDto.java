package com.bf.manager.dto;

public class BookFirstCateDto {
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
		return "BookFirstCateDto [num=" + num + ", name=" + name + "]";
	}

}
