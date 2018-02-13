package com.bf.manager.dto;

public class BoardCate1Dto {
	private int num;
	private String name;
	
	public BoardCate1Dto() {}
	public BoardCate1Dto(int num, String name) {
		super();
		this.num = num;
		this.name = name;
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
	@Override
	public String toString() {
		return "BoardCate1Dto [num=" + num + ", name=" + name + "]";
	}
	
	
}
