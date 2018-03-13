package com.bf.manager.dto;


/**
 * @ 작성자 : 전상헌
 * @ 작성일  : 2018. 3. 7.
 * @ 주제 및 설명 : 게시판 대분류 중분류 나뉘었을때  중분류 DTO
 */
public class BoardCate2Dto {
	private int num;
	private String name;
	private String cate_num;
	
	public BoardCate2Dto() {}
	public BoardCate2Dto(int num, String name, String cate_num) {
		super();
		this.num = num;
		this.name = name;
		this.cate_num = cate_num;
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
	public String getCate_num() {
		return cate_num;
	}
	public void setCate_num(String cate_num) {
		this.cate_num = cate_num;
	}
	@Override
	public String toString() {
		return "BoardCate2Dto [num=" + num + ", name=" + name + ", cate_num=" + cate_num + "]";
	}
	
	
	
	
	
}
