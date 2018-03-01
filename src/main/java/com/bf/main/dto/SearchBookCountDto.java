package com.bf.main.dto;

/**
 * @author 박성호
 * @date 2018. 3. 1.
 * @description 메인 검색 페이지에서 검색 결과를 카테고리(소분류) 별로 카운팅한 결과를 저장
 */
public class SearchBookCountDto {
	// Field
	private int num;	// 카테고리 번호
	private String name;	// 카테고리 이름
	private int count;	// 카테고리별 카운팅

	//
	public SearchBookCountDto() {
	}

	public SearchBookCountDto(int num, String name, int count) {
		this.num = num;
		this.name = name;
		this.count = count;
	}

	//
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "SearchBookCountDto [num=" + num + ", name=" + name + ", count=" + count + "]";
	}

}
