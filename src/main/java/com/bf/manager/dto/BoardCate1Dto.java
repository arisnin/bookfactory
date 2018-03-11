package com.bf.manager.dto;

/**
 * @ 작성자 : 전상헌
 * @ 작성일  : 2018. 3. 2.
 * @ 주제 및 설명 : 게시판 대분류 중분류 나뉘었을때 대분류 DTO
 */
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
